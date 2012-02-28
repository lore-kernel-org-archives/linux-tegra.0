From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v6 11/20] tegra: fdt: Add clock bindings for
 Tegra2 Seaboard
Date: Tue, 28 Feb 2012 10:41:15 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8@HQMAIL01.nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-12-git-send-email-sjg@chromium.org>
	<4F4C11E9.1050907@nvidia.com>
	<CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com>
	<CAPnjgZ1LsFeADVHRcS694EwJrz3V+ONdp9ds+bdAG5rNupQ_ag@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB0@HQMAIL01.nvidia.com>
	<CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Tuesday, February 28, 2012 11:37 AM:
> On Tue, Feb 28, 2012 at 10:31 AM, Stephen Warren <swarren@nvidia.com> wrote:
> > Simon Glass wrote at Tuesday, February 28, 2012 10:38 AM:
> > ...
> >> I am going to add your binding, less the #clock-cells which U-Boot
> >> currently can't support because it conflicts with the C preprocessor
> >> (at some point I may look at a patch to use sed or some other means of
> >> avoiding this).
> >
> > Out of curiosity, why does the C preprocessor come into it? Is U-Boot's
> > build process running cpp on the .dts files or something? That's non-
> > standard, although perhaps it could be a useful standard...
> 
> Yes, but at the moment we only use it for '/include/ ARCH_CPU_DTS'.

Uggh. That's going to make the device tree files look different between
the kernel and U-Boot:-( With # disallowed in particular, it's going to
prevent U-Boot from /ever/ using the correct protocols for parsing the
device tree. This seems like an extremely bad idea.

> Still hoping your symbolic stuff will go in though.

That looks extremely unlikely in its current form. Ideally, I will get
time to take Jon's or David's patches and push one of them forward to
provide a more complete solution, but it's a very long way out either way.

-- 
nvpublic
