From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpio: palmas: add dt support
Date: Thu, 21 Mar 2013 11:29:47 -0600
Message-ID: <514B438B.80603@wwwdotorg.org>
References: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363876214-25933-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "J, KEERTHY" <j-keerthy-l0cyMroinI0@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 08:30 AM, Laxman Dewangan wrote:
> Add of_device_id table for Palma GPIO to be enable the
> driver from DT file.

On this, the RTC patches, and the regulator patches, I think you should
be Ccing the Slimlogic guys (CC'd now) and perhaps some people from TI
(CC'd now; I hope the right people) , to make sure so that you're all on
the same page w.r.t. how the DT bindings work, and so you don't step on
each-others toes.
