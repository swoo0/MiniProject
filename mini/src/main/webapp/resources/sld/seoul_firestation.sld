<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>seoul_firestation</sld:Name>
    <sld:UserStyle>
      <sld:Name>seoul_firestation</sld:Name>
      <sld:Title>firestation</sld:Title>
      <sld:IsDefault>1</sld:IsDefault>
      <sld:FeatureTypeStyle>
        <sld:Name>name</sld:Name>
        <sld:Rule>
          <sld:Title>firestation</sld:Title>
          <sld:PointSymbolizer>
            <sld:Graphic>
              <sld:Mark>
                <sld:WellKnownName>triangle</sld:WellKnownName>
                <sld:Fill>
                  <sld:CssParameter name="fill">#ff3300</sld:CssParameter>
                </sld:Fill>
                <sld:Stroke/>
              </sld:Mark>
              <sld:Size>
                <ogc:Literal>8</ogc:Literal>
              </sld:Size>
            </sld:Graphic>
          </sld:PointSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>

