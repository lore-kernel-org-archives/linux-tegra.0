From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Various Tegra124 fixes
Date: Fri, 06 Dec 2013 10:10:01 -0700
Message-ID: <52A204E9.4080801@wwwdotorg.org>
References: <52A10C7B.8070406@wwwdotorg.org> <1386330839-30559-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386330839-30559-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/06/2013 04:53 AM, Thierry Reding wrote:
> Remove various gratuitous blank lines and other minor whitespace and
> style cleanups. Add some missing commas within group arrays to prevent
> the compiler from concatenating the strings. Remove unneeded
> TEGRA_MUX_SAFE entry from enumeration and drop gratuitous _dt suffix
> from tegra_mux enumeration type name. Drop an unwarranted FIXME comment
> and rename gmi_ad8_ph0 pin to ph0 since that's how it's referenced in
> the DS06472001 datasheet.

Thierry, I assume this patch is against the version I have in my local
development branch?

I'm expecting Laxman to roll this into the patches he posts, and send a
new complete version to LinusW, so there's no upstream action required
for this patch series at present, just an action for Laxman.
