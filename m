From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/4] Introduce table driven initializations
Date: Tue, 03 Sep 2013 12:13:32 -0600
Message-ID: <522626CC.70804@wwwdotorg.org>
References: <1378215105-12145-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378215105-12145-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/03/2013 07:31 AM, Peter De Schrijver wrote:
> This patchset introduces a table driven initialization method for the
> audio, PMC and gate clocks. It's similar to the table we already have for
> the periph clocks.

I assume these patches will all go through Mike's clock tree for 3.13.

Aside from the one issue I mentioned, the series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I assume this will be followed by changes to convert the Tegra20/30
clock drivers to be table-based too?

>  2 files changed, 455 insertions(+), 550 deletions(-)

That didn't work out as much of a line-count-reduction as I had naively
hoped. Are there any more large blocks of repetitive code left to be
converted?
