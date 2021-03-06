﻿<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="12.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProjectGuid>{37d1276e-9da3-4d81-ab80-c6e68c482efd}</ProjectGuid>
    <OutputType>AppContainerExe</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>MU_Puzzle_WinRT</RootNamespace>
    <AssemblyName>MU_Puzzle_WinRT</AssemblyName>
    <DefaultLanguage>en-US</DefaultLanguage>
    <ProjectTypeGuids>{BC8A1FFA-BEE3-4634-8014-F334798102B3};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <PackageCertificateKeyFile>MU_Puzzle_WinRT_TemporaryKey.pfx</PackageCertificateKeyFile>
    <Name>MU_Puzzle_WinRT</Name>
    <TargetPlatformVersion>8.1</TargetPlatformVersion>
    <MinimumVisualStudioVersion>12</MinimumVisualStudioVersion>
    <TargetFrameworkVersion />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <CpuType>AnyCPU</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <Optimize>false</Optimize>
    <OutputPath>bin\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <EnableUnmanagedDebugging>True</EnableUnmanagedDebugging>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <CpuType>AnyCPU</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release\</OutputPath>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|ARM'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\ARM\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>ARM</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|ARM'">
    <OutputPath>C:\Users\David\SkyDrive\Documents\dev\mu_puzzle\arm</OutputPath>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <CpuType>arm</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CrossPlatformCompatibilityHints>False</CrossPlatformCompatibilityHints>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|x64'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\x64\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>x64</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|x64'">
    <OutputPath>bin\x64\Release\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x64</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|x86'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\x86\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>x86</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|x86'">
    <OutputPath>bin\x86\Release\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x86</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <ItemGroup>
    <!-- A reference to the entire .Net Framework and Windows SDK are automatically included -->
    <Folder Include="Assets\" />
    <Folder Include="Common\" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="App.xaml.pas">
      <DependentUpon>App.xaml</DependentUpon>
    </Compile>
    <Compile Include="MainPage.xaml.pas">
      <DependentUpon>MainPage.xaml</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Assets\Logo.png" />
    <Content Include="Assets\WideLogo.png" />
    <Content Include="Assets\SmallLogo.png" />
    <Content Include="Assets\SplashScreen.png" />
    <Content Include="Assets\StoreLogo.png" />
    <AppxManifest Include="Package.appxmanifest">
      <SubType>Content</SubType>
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </AppxManifest>
  </ItemGroup>
  <ItemGroup>
    <ApplicationDefinition Include="App.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </ApplicationDefinition>
    <Page Include="Common\StandardStyles.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </Page>
    <Page Include="MainPage.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </Page>
  </ItemGroup>
  <PropertyGroup Condition=" '$(VisualStudioVersion)' == '' or '$(VisualStudioVersion)' &lt; '12.0' ">
    <VisualStudioVersion>12.0</VisualStudioVersion>
  </PropertyGroup>
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it.
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <ItemGroup>
    <Reference Include="mscorlib" />
  </ItemGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release for Surface|AnyCPU' ">
    <CpuType>AnyCPU</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <Optimize>true</Optimize>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <OutputPath>bin\Release for Surface\</OutputPath>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release for Surface|ARM'">
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <CpuType>arm</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
    <OutputPath>C:\Users\David\SkyDrive\Documents\dev\mu_puzzle\arm</OutputPath>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CrossPlatformCompatibilityHints>False</CrossPlatformCompatibilityHints>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release for Surface|x64'">
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x64</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
    <OutputPath>bin\Release for Surface\</OutputPath>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release for Surface|x86'">
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x86</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
    <OutputPath>bin\Release for Surface\</OutputPath>
  </PropertyGroup>
  <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props')" />
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.WinRT.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>