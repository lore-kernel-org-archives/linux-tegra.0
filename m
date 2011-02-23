From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Problem with "ARM: tegra: Move tegra_common_init to
 tegra_init_early"
Date: Wed, 23 Feb 2011 09:13:59 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5CD6@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF03112A5C22@HQMAIL01.nvidia.com>
 <AANLkTimgw6kruGMp=wJUVka+Gj2cn9X=qRucbnuq-b9V@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimgw6kruGMp=wJUVka+Gj2cn9X=qRucbnuq-b9V-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Russell King - ARM Linux (linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org)" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Wednesday, February 23, 2011 12:43 AM:
> 
> On Tue, Feb 22, 2011 at 7:12 PM, Stephen Warren wrote:
> > The following commit makes the Tegra APB DMA engine fail to initialize
> > correctly:
> >
> > ARM: tegra: Move tegra_common_init to tegra_init_early
> > ...
> > I tried moving the call to tegra_dma_init back to each of the very end
> > of tegra_init_irq and the very beginning of tegra_harmony_init. Both
> > of these resulted in a kernel that wouldn't boot.
>
> I don't know why it still fails if you put it back at the beginning of
> the machine init, and it boots without errors on my board if I move
> tegra_dma_init to a postcore_initcall, but I don't have any drivers on
> my board that use DMA.

It looks like the fail-to-boot symptom was an operator error or
incremental build problem. I retested everything with a from-scratch
build and moving tegra_dma_int to be a postcore_initcall solves the issue
for me; I've posted a patch to do that.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
