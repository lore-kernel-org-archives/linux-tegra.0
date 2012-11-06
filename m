From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Mon, 05 Nov 2012 20:41:53 -0700
Message-ID: <50988701.5080602@wwwdotorg.org>
References: <5097F013.8070002@wwwdotorg.org> <1352165844-4837-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352165844-4837-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/05/2012 06:37 PM, Dmitry Osipenko wrote:
> Added suspend/resume support using pm ops. We need to store current regs vals on
> suspend and restore them on resume. Platform driver registering function moved to
> core init level to ensure that device driver will be in the end of suspend and in
> the beginning of resume lists.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Pritesh, what do you think about this patch?
> 
>> BTW, can you please post a link to the source for your downstream kernel
>> that this came from - I'd be very interested in seeing what work has
>> been done there. Thanks.
> 
> I have sent invitation to you on bitbucket.

Oh, it's not public? I've been asked not to sign any NDAs/agreements/...
without review from NVIDIA legal, and a non-public git repo seems like
it'd fall into the same category. I'm left wondering how the repo is
useful if it isn't public.
