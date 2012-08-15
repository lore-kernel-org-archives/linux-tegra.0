From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: whistler: add regulators
Date: Wed, 15 Aug 2012 10:58:45 -0600
Message-ID: <502BD545.1010300@wwwdotorg.org>
References: <1344017484-29395-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344017484-29395-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/03/2012 12:11 PM, Stephen Warren wrote:
> Whistler uses a Maxim 8907 regulator. Instantiate this.
> 
> The voltage settings were derived from the schematic. The only exception
> is the BBAT voltage; the schematic says 1.2v, but the HW can't go that
> low, so use the HW default of 2.4v instead.
> 
> Almost all regulators list all driven supply signal names in their
> regulator-names property. The exception is nvvdd_sv3, which is in turn
> named 12 more different names on the schematic, so these were omitted
> for brevity.

Applied to Tegra's for-3.7/dt branch.
