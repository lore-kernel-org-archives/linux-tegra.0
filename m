From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: tegra: Remove USB platform data
Date: Mon, 15 Jul 2013 17:22:58 -0600
Message-ID: <51E48452.8010600@wwwdotorg.org>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com> <1373918029-28977-5-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373918029-28977-5-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/15/2013 01:53 PM, Tuomas Tynkkynen wrote:
> USB-related platform data is not used anymore in the Tegra USB drivers,
> so remove all of it.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(I said that for v1 too. Tuomas, you can cut/paste that ack into the
commit description to keep it for any future postings).

I think it's best to take this patch through the USB tree along with the
rest. Otherwise, we'd have to wait for 3.13 to apply it. I don't believe
this will cause any conflicts.
