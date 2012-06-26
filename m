From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 14:47:56 +0200
Message-ID: <1340714876.1364.10.camel@antimon>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626105513.GA9552-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry,

I still haven't found the time to look at device tree things in detail,
but still some comments inline. Overall I think the tree looks ok and is
a great thing to get started.

Am Dienstag, den 26.06.2012, 12:55 +0200 schrieb Thierry Reding:
> Hi,
> 
> while I haven't got much time to work on the actual code right now, I
> think it might still be useful if we could get the device tree binding
> to a point where everybody is happy with it. That'll also save me some
> time once I get to writing the code because I won't have to redo it over
> again. =)
> 
> So here's the current proposal:
> 
> 	host1x {
> 		compatible = "nvidia,tegra20-host1x", "simple-bus";
> 		reg = <0x50000000 0x00024000>;
> 		interrupts = <0 64 0x04   /* cop syncpt */
> 			      0 65 0x04   /* mpcore syncpt */
> 			      0 66 0x04   /* cop general */
> 			      0 67 0x04>; /* mpcore general */
> 
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		ranges = <0x54000000 0x54000000 0x04000000>;
> 
> 		status = "disabled";
> 
> 		gart = <&gart>;
> 
Do we really need this here? IMHO the GART is one kind of a IOMMU
managing a part of the bus where the host1x driver is hanging of. So I
can't see why we would need a pointer to the gart dev directly.
Though I may be off here, as I don't grok everything related to the
initiation order yet, so please correct me if I'm wrong.
 
> 		/* video-encoding/decoding */
> 		mpe {
> 			reg = <0x54040000 0x00040000>;
> 			interrupts = <0 68 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* video input */
> 		vi {
> 			reg = <0x54080000 0x00040000>;
> 			interrupts = <0 69 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* EPP */
> 		epp {
> 			reg = <0x540c0000 0x00040000>;
> 			interrupts = <0 70 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* ISP */
> 		isp {
> 			reg = <0x54100000 0x00040000>;
> 			interrupts = <0 71 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* 2D engine */
> 		gr2d {
> 			reg = <0x54140000 0x00040000>;
> 			interrupts = <0 72 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* 3D engine */
> 		gr3d {
> 			reg = <0x54180000 0x00040000>;
> 			status = "disabled";
> 		};
> 
> 		/* display controllers */
> 		dc1: dc@54200000 {
> 			compatible = "nvidia,tegra20-dc";
> 			reg = <0x54200000 0x00040000>;
> 			interrupts = <0 73 0x04>;
> 			status = "disabled";
> 		};
> 
> 		dc2: dc@54240000 {
> 			compatible = "nvidia,tegra20-dc";
> 			reg = <0x54240000 0x00040000>;
> 			interrupts = <0 74 0x04>;
> 			status = "disabled";
> 		};
> 
> 		/* outputs */
> 		rgb {
> 			compatible = "nvidia,tegra20-rgb";
> 			status = "disabled";
> 		};
> 
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
> This really isn't anything new but merely brings the Tegra DRM binding
> in sync with other devices in tegra20.dtsi (disable devices by default,
> leave out unit addresses for unique nodes). The only actual change is
> that host1x clients are now children of the host1x node. The children
> are instantiated by the initial call to of_platform_populate() since the
> host1x node is also marked compatible with "simple-bus".
> 
We should not rely on OF code doing the instantiation of the children,
as expressed by Grant Likely. [1]

> An alternative would be to call of_platform_populate() from the host1x
> driver. This has the advantage that it could integrate better with the
> host1x bus implementation that Terje is working on, but it also needs
> additional code to tear down the devices when the host1x driver is
> unloaded because a module reload would try to create duplicate devices
> otherwise.
> 
[snip]

[1]
http://www.mail-archive.com/linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg28044.html

Thanks,
Lucas
