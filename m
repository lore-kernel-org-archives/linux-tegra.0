From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] ARM: tegra: definitions for flow controller
Date: Thu, 26 Jan 2012 18:17:25 -0800
Message-ID: <CAOesGMghrFvCzyTaLfeF5RB77UUxpzEQj+j5Ega_uzL1SdbrOg@mail.gmail.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
	<1327594923-21822-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327594923-21822-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Jan 26, 2012 at 8:22 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Introduce some definitions for the tegra flow contoller. This will be
> used by the code which controls entering and leaving LP3.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Do you expect to use these defines anywhere else than in the sleep.S
in the near future? If not, please just move them over to that file.

-Olof
