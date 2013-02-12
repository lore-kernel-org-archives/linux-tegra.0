From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6 08/10] ARM: dt: Add references to tegra_car clocks
Date: Tue, 12 Feb 2013 10:24:05 -0700
Message-ID: <511A7AB5.4040607@wwwdotorg.org>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com> <1360580700-10245-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360580700-10245-9-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/11/2013 04:04 AM, Peter De Schrijver wrote:
> Add references to tegra_car clocks for the basic device nodes.

In this patch, you also need to remove the "clock-frequency" properties
from tegra114-*.dts board files.
