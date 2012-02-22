From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 02/10] ARM: tegra: export Tegra chipid
Date: Wed, 22 Feb 2012 11:19:53 -0800
Message-ID: <CAMbhsRScEnZQrO3Ufrop+Me_ZKoZ=Cd7HqeAdDUOTe2dLPEjiQ@mail.gmail.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
	<1328831277-21002-3-git-send-email-pdeschrijver@nvidia.com>
	<CAMbhsRT-ZTh7WQ1E0NUjX8FOMGAvx5zNnB-VYD=j8sWhM-9j+A@mail.gmail.com>
	<CAOesGMi=nsKr91uu=QTpJ_vKKhc9GBRHPWd6XEB+rOqph_P+yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMi=nsKr91uu=QTpJ_vKKhc9GBRHPWd6XEB+rOqph_P+yA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 20, 2012 at 3:30 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> On Mon, Feb 20, 2012 at 3:13 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
>
>> Other platforms use accessors for this (cpu_is_xxx(), although
>> soc_is_xxx() is probably more appropriate).
>
> I have previously objected to additions of said functions on tegra,
> since they tend to start crawling into drivers as runtime tests
> instead of providing more appropriate detection at probe time.
>
> I can be persuaded differently but I haven't yet seen a strong case
> for changing my mind. :)

soc_is_xxx() is better than spreading tegra_chip_id == XXX all over
the place, but keeping them out of drivers completely is even better.
