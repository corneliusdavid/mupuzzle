<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>10.0.20506</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{0be9271b-7d1c-4af6-beed-a117e7874551}</ProjectGuid>
    <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{C089C8C0-30E0-4E22-80C0-CE093F111A43};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>MU_PuzzleWinPhone8</RootNamespace>
    <AssemblyName>MU_PuzzleWinPhone8</AssemblyName>
    <TargetFrameworkIdentifier>WindowsPhone</TargetFrameworkIdentifier>
    <TargetFrameworkVersion>v8.0</TargetFrameworkVersion>
    <SilverlightVersion>$(TargetFrameworkVersion)</SilverlightVersion>
    <SilverlightApplication>true</SilverlightApplication>
    <SupportedCultures>
    </SupportedCultures>
    <XapOutputs>true</XapOutputs>
    <GenerateSilverlightManifest>true</GenerateSilverlightManifest>
    <XapFilename>MU_PuzzleWinPhone8_$(Configuration)_$(Platform).xap</XapFilename>
    <SilverlightManifestTemplate>Properties\AppManifest.xml</SilverlightManifestTemplate>
    <SilverlightAppEntry>MU_PuzzleWinPhone8.App</SilverlightAppEntry>
    <ValidateXaml>true</ValidateXaml>
    <MinimumVisualStudioVersion>11.0</MinimumVisualStudioVersion>
    <ThrowErrorsInValidation>true</ThrowErrorsInValidation>
    <Name>MU_PuzzleWinPhone8</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>Bin\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CpuType>anycpu</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>Bin\Release</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|x86' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>Bin\x86\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|x86' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>Bin\x86\Release</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|ARM' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>False</Optimize>
    <OutputPath>Bin\ARM\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CpuType>anycpu</CpuType>
    <GeneratePDB>True</GeneratePDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|ARM' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>Bin\ARM\Release</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="App.xaml.pas">
      <DependentUpon>App.xaml</DependentUpon>
    </Compile>
    <Compile Include="LocalizedStrings.pas" />
    <Compile Include="PhonePage.xaml.pas">
      <DependentUpon>PhonePage.xaml</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Compile Include="Resources\AppResources.Designer.pas">
      <DependentUpon>Resources\AppResources.resx</DependentUpon>
    </Compile>
  </ItemGroup>
  <ItemGroup>
    <ApplicationDefinition Include="App.xaml">
      <SubType>Designer</SubType>
      <Generator>MSBuild:Compile</Generator>
    </ApplicationDefinition>
    <Page Include="PhonePage.xaml">
      <SubType>Designer</SubType>
      <Generator>MSBuild:Compile</Generator>
    </Page>
  </ItemGroup>
  <ItemGroup>
    <None Include="Properties\AppManifest.xml" />
    <None Include="Properties\WMAppManifest.xml">
      <SubType>Designer</SubType>
    </None>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Assets\AlignmentGrid.png" />
    <Content Include="Assets\AppBar\cancel.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Assets\AppBar\check.png">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Assets\ApplicationIcon.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileLarge.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileMedium.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileSmall.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\IconicTileMediumLarge.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\IconicTileSmall.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <EmbeddedResource Include="Resources\AppResources.resx">
      <Generator>PublicResXFileCodeGenerator</Generator>
    </EmbeddedResource>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Assets\" />
    <Folder Include="Assets\AppBar" />
    <Folder Include="Assets\Tiles\" />
    <Folder Include="Properties\" />
    <Folder Include="Resources\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\MU_PuzzlePhoneClass\MU_PuzzlePhoneClasses.oxygene">
      <Name>MU_PuzzlePhoneClasses</Name>
      <Project>{cf18e3db-1aaf-465d-8413-697b1b3b0ad6}</Project>
      <Private>True</Private>
      <HintPath>..\MU_PuzzlePhoneClass\Bin\ARM\Debug\MU_PuzzlePhoneClass.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it.
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{c089c8c0-30e0-4e22-80c0-ce093f111a43}" User="">
        <SilverlightMobileCSProjectFlavor>
          <FullDeploy>False</FullDeploy>
          <DebuggerType>Managed</DebuggerType>
          <DebuggerAgentType>Managed</DebuggerAgentType>
          <Tombstone>False</Tombstone>
        </SilverlightMobileCSProjectFlavor>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\Microsoft.$(TargetFrameworkIdentifier).$(TargetFrameworkVersion).Overrides.targets" />
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\RemObjects.Oxygene.Echoes.$(TargetFrameworkIdentifier).targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>