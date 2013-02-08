From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DT: tegra: Add Tegra30 Beaver board support
Date: Fri, 08 Feb 2013 21:40:24 +0000
Message-ID: <20130208214024.9467E3E2C27@localhost>
References: <1356032489-27619-1-git-send-email-pengw@nvidia.com> <50DDC743.2080606@gmail.com> <50DE3146.6090001@nvidia.com> <CAOesGMgW890K4Wo2-SFE4YFn5f8T950BTZ82rkCQfwpV+bsRyQ@mail.gmail.com> <50E478AF.2040406@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E478AF.2040406-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2 Jan 2013 10:13:03 -0800, Peng Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 12/28/2012 08:43 PM, Olof Johansson wrote:
> > On Fri, Dec 28, 2012 at 3:54 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> On 12/28/2012 09:22 AM, Rob Herring wrote:
> >>> On 12/20/2012 01:41 PM, Bryan Wu wrote:
> >>>> This patch adds support for Tegra30 Beaver board in upstream kernel.
> >>>> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
> >>>> +/ {
> >>>> +    model = "NVIDIA Tegra30 Beaver evaluation board";
> >>>> +    compatible = "nvidia,beaver", "nvidia,tegra30";
> >>> nvidia,beaver needs to be documented.
> >> Hmmm. I guess we've managed not to document /any/ of the Tegra
> >> board-level compatible values. Bryan, could you make a separate patch to
> >> add all the existing board compatible values to
> >> Documentation/devicetree/bindings/arm/tegra.txt. The Beaver addition to
> >> that file can still be part of the Beaver-specific patch though.
> > Does it need to be documented? Then the "support a new platform only
> > through DTS update" is no longer true. :)
> >
> > In the past, I don't think we've strictly documented all derivative
> > platform compatible values, just some of the reference ones?
> >
> >
> > -Olof
> 
> Actually in every Tegra board dts file, there is a model string to 
> describe this machine as well as a compatible board string, just like 
> the "nvidia,beaver". So do we still need put this duplicated information 
> in a document file? Or if this is the requirement of DeviceTree. I will 
> do that. I think we have 12 boards need to add such document currently.

The model string is intended to be human-friendly, where as compatible
is primarily the matching mechanism.

I don't think it is stricly necessary to document top level compatible
strings unless there is something quirky that begs to be documented.
