From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra DRM device tree bindings
Date: Fri, 6 Jul 2012 13:29:42 +0800
Message-ID: <23B010BBA481A74B98487467C29BA57BF23653C0C7@HKMAIL01.nvidia.com>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <20120705121506.GA23732@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120705121506.GA23732-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Thierry Reding
> Sent: Thursday, July 05, 2012 8:15 PM
> To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: Tegra DRM device tree bindings
> 
> * PGP Signed by an unknown key
> 
> Here's a new proposal that should address all issues collected during the
> discussion of the previous one:
> 
> From tegra20.dtsi:
> 
> 	host1x {
> 		compatible = "nvidia,tegra20-host1x", "simple-bus";
> 		reg = <0x50000000 0x00024000>;
> 		interrupts = <0 65 0x04   /* mpcore syncpt */
> 			      0 67 0x04>; /* mpcore general */
> 
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		ranges = <0x54000000 0x54000000 0x04000000>;
> 
> 		/* video-encoding/decoding */
> 		mpe {
> 			reg = <0x54040000 0x00040000>;
> 			interrupts = <0 68 0x04>;
> 		};
> 
> 		/* video input */
> 		vi {
> 			reg = <0x54080000 0x00040000>;
> 			interrupts = <0 69 0x04>;
> 		};
> 
> 		/* EPP */
> 		epp {
> 			reg = <0x540c0000 0x00040000>;
> 			interrupts = <0 70 0x04>;
> 		};
> 
> 		/* ISP */
> 		isp {
> 			reg = <0x54100000 0x00040000>;
> 			interrupts = <0 71 0x04>;
> 		};
> 
> 		/* 2D engine */
> 		gr2d {
> 			reg = <0x54140000 0x00040000>;
> 			interrupts = <0 72 0x04>;
> 		};
> 
> 		/* 3D engine */
> 		gr3d {
> 			reg = <0x54180000 0x00040000>;
> 		};
> 
> 		/* display controllers */
> 		dc@54200000 {
> 			compatible = "nvidia,tegra20-dc";
> 			reg = <0x54200000 0x00040000>;
> 			interrupts = <0 73 0x04>;
> 
> 			rgb {
> 				status = "disabled";
> 			};
> 		};
> 
> 		dc@54240000 {
> 			compatible = "nvidia,tegra20-dc";
> 			reg = <0x54240000 0x00040000>;
> 			interrupts = <0 74 0x04>;
> 
> 			rgb {
> 				status = "disabled";
> 			};
> 		};
> 
> 		/* outputs */
> 		hdmi {
> 			compatible = "nvidia,tegra20-hdmi";
> 			reg = <0x54280000 0x00040000>;
> 			interrupts = <0 75 0x04>;
> 			status = "disabled";
> 		};
> 
> 		tvo {
> 			compatible = "nvidia,tegra20-tvo";
> 			reg = <0x542c0000 0x00040000>;
> 			interrupts = <0 76 0x04>;
> 			status = "disabled";
> 		};
> 
> 		dsi {
> 			compatible = "nvidia,tegra20-dsi";
> 			reg = <0x54300000 0x00040000>;
> 			status = "disabled";
> 		};
> 	};
> 
> From tegra20-medcom.dts:
> 
> 	host1x {
> 		dc@54200000 {
> 			rgb {
> 				nvidia,edid = /incbin/("tegra20-medcom.edid");
> 				status = "okay";
> 			};
> 		};
> 	};
> 
> From tegra20-plutux.dts:
> 
> 	host1x {
> 		hdmi {
> 			vdd-supply = <&ldo7_reg>;
> 			pll-supply = <&ldo8_reg>;
> 
> 			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
> 			nvidia,ddc-i2c-bus = <&ddc>;
> 
> 			status = "okay";
> 		};
> 	};
> 
> One problem I've come across when trying to get some rudimentary code
> working with this is that there's no longer a device which the DRM driver can bind
> to, because the top-level device (host1x) now has a separate driver.
> 
> I've briefly discussed this with Dave Airlie on IRC and there are basically two
> solutions:
> 
>   a) Use a fake platform device, instantiated from the device tree or at
>      module initialization time, so that the drm_platform_init()
>      function can be used.
 
If we change the dts to this version, that means we should register all drivers(dc/rgb/dsi...) during host1x driver initialization.
In that case, I think we can register drm driver as well.
It's not a good idea to add drm into dts cause just as you said, it's not a real device at all.

>   b) Implement a custom drm_bus and reimplement most of the
>      functionality provided by drm_platform_init().
> 
> Alternative a) is what Sascha has been doing for i.MX and is the most
> straightforward. One variant of this would be to add another virtual device node
> below host1x that groups gr2d, gr3d, both dcs and the three output nodes. The
> down-side of this being that it doesn't describe the hardware of course, and
> therefore really shouldn't go into the device tree. Instantiating at module
> initalization time has the disadvantage that the parent-child relationship is lost.
> 
> Using b) isn't optimal either because DRM requires at least a struct device which
> can be associated with the drm_device. So the question is which struct device
> that should be?
> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
