From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:54:23 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5DA9@HQMAIL01.nvidia.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
	<AANLkTi=tDJvfEFFvXGEkZswRWekRLuz4rBoT-0hgobgn@mail.gmail.com>
	<AANLkTinzVinbW_rDt5Rqe7i68P2u_XvDvRWA8R2mq0_9@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5D95@HQMAIL01.nvidia.com>
 <AANLkTikmP5H6TQN1v1BNbGTfGokHgyXQ5LbFpEWgWjPB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikmP5H6TQN1v1BNbGTfGokHgyXQ5LbFpEWgWjPB-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, February 23, 2011 2:52 PM:
> 
> On Wed, Feb 23, 2011 at 1:35 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > ...
> > OK, so just so I'm clear:
> >
> > Patches 1..4 are all going in as-is.
> >
> > I should re-post patch 5 once the merge window is open, having rebased
> > it on Olof's i2c registration changes, and
> > s/GPIO_WM8903/HARMONY_GPIO_WM8903/. Or, should I repost as soon as Olof
> > has updated his branch with the I2C changes, and you'll just hold off
> > applying it until the merge window?
> 
> How big would the delta be between a patch that would apply (and work)
> with current .38-rc wm8903 platform data? If it's just the GPIO base,
> we can merge everything but that and just do the small change late in
> the merge window.

Once the I2C tree is merged, the only thing needed to make my patch
apply immediately is to remove the gpio_base assignment. I can split
that into a separate patch and post a series if that helps.

> And yeah, please repost after the i2c stuff is in my branch, I'll
> stage it accordingly.

Great, thanks.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
