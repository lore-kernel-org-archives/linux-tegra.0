From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Tue, 24 Jan 2012 14:08:54 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81EC4@HQMAIL01.nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
 <20120124095241.GO10446@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120124095241.GO10446-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, January 24, 2012 2:53 AM:
> What about the peripheral resets which are also handled by CAR? Peripheral
> clock nodes also offer assert and deassert methods for the reset signal
> associated with them. Those methods are used when powergating domains for
> example. Should we model this in the same binding?

In most cases, I think the resets are handled purely within clock enable
and disable, so there's no need to explicitly manage them or represent
them in the device tree. Do you agree here?

I recall that you mentioned some power-management code might need to
manage reset separately though. Can you explain why a module would be
reset separately from disabling the clocks though?

If we do need this, I think we can just add a property to the node of
each device that needs such explicit management. Something like:

tegra_car: clock@60006000 {
    compatible = "nvidia,tegra20-car";
    ....
};

foo@70007000 {
    compatible = "nvidia,tegra20-foo";
    regs = <...>;
    nvidia,car-reset-id = <&tegra_car 30>;
};

And the driver for "foo" can ignore cell 0, and extract the cell 1 and
pass the value to tegra_periph_reset_assert().

I'd expect to put the CAR phandle into the property in case we ever get
a more generalized reset subsystem, and need more general code to
interpret the property. I did the same for the Tegra APB DMA controller
client binding where clients need to know the "DMA select" value.

Does that all seem reasonable?

-- 
nvpublic
