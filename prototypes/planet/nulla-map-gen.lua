data:extend({

{type="noise-expression",name="nulla_segmentation_multiplier",expression="1"},

{
	type = "noise-expression",
	name = "nulla_spawn_island",
	expression = "clamp(core + edge,0,1)*22",
	local_expressions =
	{
		dist = "sqrt(x*x+y*y)",
		core = "1-dist/(60+shape*8)",
		shape = "multioctave_noise{x=x,y=y,seed0=map_seed,seed1=9999,octaves=3,persistence=0.65,input_scale=1/20}",
		edge = "multioctave_noise{x=x,y=y,seed0=map_seed,seed1=9998,octaves=2,persistence=0.7,input_scale=1/8}*0.15"
	}
},

{type="noise-expression",name="nulla_elevation",expression="-12+48*clamp(base_islands+detail,0,1)+nulla_spawn_island",local_expressions={base_islands="abs(amplitude_corrected_multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5000,input_scale=nulla_segmentation_multiplier/3.8,offset_x=12000,octaves=5,persistence=0.68,amplitude=1})",detail="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5001,octaves=3,persistence=0.1,input_scale=1/20}*0.22"}},

{type="noise-expression",name="nulla_height",expression="clamp((nulla_elevation+14)/40,0,1)"},

{type="noise-expression",name="nulla_deep_ocean",expression="clamp(0.08-nulla_height,0,1)*1000"},

{type="noise-expression",name="nulla_ocean",expression="clamp((nulla_height-0.06)*22.5,0,1)*clamp((0.34-nulla_height)*22.5,0,1)*900"},

{type="noise-expression",name="nulla_biome1",expression="clamp((nulla_height-0.12)*6,0,1)*clamp((0.60-nulla_height)*6,0,1)*800"},

{type="noise-expression",name="nulla_biome2",expression="clamp((nulla_height-0.35)*4,0,1)*clamp((0.65-nulla_height)*4,0,1)*700"},

{type="noise-expression",name="nulla_biome3",expression="clamp((nulla_height-0.55)*4,0,1)*clamp((0.80-nulla_height)*4,0,1)*600"},

{type="noise-expression",name="nulla_biome4",expression="clamp((nulla_height-0.70)*3.5,0,1)*clamp((0.92-nulla_height)*3.5,0,1)*500"},

{type="noise-expression",name="nulla_biome5",expression="clamp((nulla_height-0.82)*3,0,1)*400"},

{type="noise-expression",name="nulla_biome6",expression="clamp((nulla_height-0.90)*2.5,0,1)*300"},



{type="noise-expression", name="nulla_crater_small", expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5100,octaves=4,persistence=0.5,input_scale=1/6}*0.08"},

{type="noise-expression", name="nulla_crater_large", expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5200,octaves=3,persistence=0.6,input_scale=1/20}*0.02"},

{type="noise-expression", name="nulla_dune_decal", expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5300,octaves=4,persistence=0.7,input_scale=1/16}*0.01"},

{type="noise-expression", name="nulla_chimney_truncated", expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5400,octaves=4,persistence=0.7,input_scale=1/32}*0.005"},

{type="noise-expression", name="nulla_chimney_short", expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=5500,octaves=5,persistence=0.5,input_scale=1/48}*0.003"},


{type="noise-expression",name="nulla_rock_clusters",expression="clamp(multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6000,octaves=2,persistence=0.6,input_scale=1/32}-0.55,0,1)"},

{type="noise-expression",name="nulla_rock_shape",expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6001,octaves=3,persistence=0.7,input_scale=1/10}"},

{type="noise-expression",name="nulla_rock_detail",expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6002,octaves=2,persistence=0.75,input_scale=1/4}"},

{type="noise-expression",name="nulla_huge_rock",expression="nulla_rock_clusters*clamp(nulla_rock_shape-0.45,0,1)*clamp(nulla_height-0.45,0,1)*clamp(nulla_elevation*0.08,0,1)*1.4"},

{type="noise-expression",name="nulla_big_rock",expression="nulla_rock_clusters*clamp(nulla_rock_shape+nulla_rock_detail-0.50,0,1)*clamp(nulla_height-0.40,0,1)*clamp(nulla_elevation*0.08,0,1)"},



{type="noise-expression", name="nulla_scrap_probability", 
 expression="clamp(multioctave_noise{x=x*(1/control:nulla_scrap:size)/50, y=y*(1/control:nulla_scrap:size)/50, seed0=map_seed, seed1=7000, octaves=1, persistence=0.5} - 0.9, 0, 1) * 10"},

{type="noise-expression", name="nulla_scrap_richness", 
 expression="1500 * multioctave_noise{x=x*control:nulla_scrap:richness/50, y=y*control:nulla_scrap:richness/50, seed0=map_seed, seed1=7001, octaves=1, persistence=0.5} * pow(nulla_scrap_probability, 0.3)"},



{type="noise-expression",name="nulla_remnant_clusters",expression="clamp(multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6100,octaves=2,persistence=0.65,input_scale=1/14}-0.6,0,1)"},
{type="noise-expression",name="nulla_remnant_shape",expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6101,octaves=3,persistence=0.7,input_scale=1/9}"},
{type="noise-expression",name="nulla_remnant_detail",expression="multioctave_noise{x=x,y=y,seed0=map_seed,seed1=6102,octaves=2,persistence=0.75,input_scale=1/3.5}"},
{type="noise-expression",name="nulla_remnant_density",expression="nulla_remnant_clusters*clamp(nulla_height-0.35,0,1)*clamp(nulla_elevation*0.08,0,1)"},

{type="noise-expression",name="nulla_medium_remnants",expression="nulla_remnant_density*clamp(nulla_remnant_shape-0.48,0,1)*0.2*control:nulla_remnants:frequency"},
{type="noise-expression",name="nulla_small_remnants",expression="nulla_remnant_density*clamp(nulla_remnant_shape+nulla_remnant_detail*1.15-0.36,0,1)*0.8*control:nulla_remnants:frequency"},
{type="noise-expression",name="nulla_cargo_pod",expression = "nulla_remnant_density*0.02"},


{type = "noise-expression",name = "nulla_enemy_base_radius",expression = "sqrt(control:nulla_enemy_base:size) * (25 + 5 * enemy_base_intensity)"},
{type = "noise-expression",name = "nulla_enemy_base_frequency",expression = "(0.00002 + 0.000006 * enemy_base_intensity) * control:nulla_enemy_base:frequency"},



{type="noise-expression",name="nulla_nuclear_crater",expression="0.0001*control:nulla_nuclear_waste:frequency"}

})