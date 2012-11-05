From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] pinctrl: tegra: add suspend/resume support
Date: Mon, 05 Nov 2012 09:57:55 -0700
Message-ID: <5097F013.8070002@wwwdotorg.org>
References: <5092EB25.5020404@wwwdotorg.org> <1351902619-911-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351902619-911-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/02/2012 06:30 PM, Dmitry Osipenko wrote:
> Added suspend/resume support using pm ops. We need to store current regs vals on
> suspend and restore them on resume. Platform driver registering function moved to
> core init level to ensure that device driver will be in the end of suspend and in
> the beginning of resume lists.

Thanks for this. I'll let you and Pritesh sort out a final version and
then take a look at that.

BTW, can you please post a link to the source for your downstream kernel
that this came from - I'd be very interested in seeing what work has
been done there. Thanks.
