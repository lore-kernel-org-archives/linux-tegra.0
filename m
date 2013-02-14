From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6 08/10] ARM: dt: Add references to tegra_car clocks
Date: Thu, 14 Feb 2013 10:30:39 -0700
Message-ID: <511D1F3F.1020309@wwwdotorg.org>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com> <1360580700-10245-9-git-send-email-pdeschrijver@nvidia.com> <511A7AB5.4040607@wwwdotorg.org> <20130213113807.GE3073@tbergstrom-lnx.Nvidia.com> <511BC3C3.6070402@wwwdotorg.org> <20130214100112.GH3073@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130214100112.GH3073-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/14/2013 03:01 AM, Peter De Schrijver wrote:
> On Wed, Feb 13, 2013 at 05:48:03PM +0100, Stephen Warren wrote:
...
>> You still need to initialize all the UART clocks in init_table[]. This
...
> Yes. The parent relationships still need to be defined. But I think that's
> the only thing we actually need to define still?

You might want to explicitly set the rate too, if there is a divider in
the clk module that affects it. If not, then parenting is indeed all you
need.

> Also the parent relationships
> can be board specific I think in some cases, so maybe we want to move those to
> DT as well at some point?

Yes, that's the plan. I think/thought Prashant was planning to work on that.
