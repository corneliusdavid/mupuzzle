<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>10.0.20506</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{cf18e3db-1aaf-465d-8413-697b1b3b0ad6}</ProjectGuid>
    <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{C089C8C0-30E0-4E22-80C0-CE093F111A43};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>MU_PuzzlePhoneClass</RootNamespace>
    <AssemblyName>MU_PuzzlePhoneClass</AssemblyName>
    <TargetFrameworkIdentifier>WindowsPhone</TargetFrameworkIdentifier>
    <TargetFrameworkVersion>v8.0</TargetFrameworkVersion>
    <SilverlightVersion>$(TargetFrameworkVersion)</SilverlightVersion>
    <SilverlightApplication>false</SilverlightApplication>
    <ValidateXaml>true</ValidateXaml>
    <MinimumVisualStudioVersion>11.0</MinimumVisualStudioVersion>
    <ThrowErrorsInValidation>true</ThrowErrorsInValidation>
    <Name>MU_PuzzlePhoneClasses</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>Bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
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
    <Optimize>false</Optimize>
    <OutputPath>Bin\ARM\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
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
    <Compile Include="MuString.pas" />
    <Compile Include="Properties\AssemblyInfo.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ProjectExtensions />
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it.
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\Microsoft.$(TargetFrameworkIdentifier).$(TargetFrameworkVersion).Overrides.targets" />
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\RemObjects.Oxygene.Echoes.$(TargetFrameworkIdentifier).targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>