From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 1/4] gpio/tegra: Remove use of irq_to_gpio
Date: Fri, 12 Aug 2011 09:07:27 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24E3D@HQMAIL01.nvidia.com>
References: <1313095404-27858-1-git-send-email-swarren@nvidia.com>
 <CAMbhsRRGDAmYv3_EbJ+WVg0C7e3-FFcLCgq4W325ECKX06M6Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRRGDAmYv3_EbJ+WVg0C7e3-FFcLCgq4W325ECKX06M6Hg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Thursday, August 11, 2011 2:54 PM:
> On Thu, Aug 11, 2011 at 1:43 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > irq_to_gpio is being removed. Replace the only use of that API by
> > the ARM Tegra sub-architecture.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > This series is the irq_to_gpio patches I posted last week, rebased to ToT,
> > plus removing Tegra's custom gpio_to_irq.
> >
> > This series was tested against next-20110811 on Harmony, by playing audio
> > and plugging/unplugging headphones. Headphone detection relies on using a
> > GPIO as an IRQ, and hence on gpio_to_irq.
> 
> This whole series looks good to me:
> Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Grant, Does this series look OK to you? Russell asked me to add it to the
ARM patch system once you'd Ack'd it.

Thanks.

-- 
nvpublic
