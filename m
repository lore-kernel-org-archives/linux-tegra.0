From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: tegra20/tegra30: Correct clock id for UARTB
Date: Fri, 08 Mar 2013 10:47:31 -0700
Message-ID: <513A2433.2080002@wwwdotorg.org>
References: <1362751245-32432-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362751245-32432-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/08/2013 07:00 AM, Laxman Dewangan wrote:
> UARTB clock bit in CAR register is 7. Correcting this
> in DTS file.

The register bit is 7, but the clock ID in the Tegra CAR DT binding is
96 for UART2 or 97 for VFIR. This was due to there being 1 clock bit and
2 separate IP block reset bits, or the other way around, so we highlight
the issue by assigning different clock IDs. See the comment before the
list of clock IDs in the binding document.
