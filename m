From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Support TPM on nyan boards
Date: Fri, 15 May 2015 08:20:30 -0600
Message-ID: <555600AE.5090609@wwwdotorg.org>
References: <1431526194-11744-1-git-send-email-sjg@chromium.org> <55536001.6080901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55536001.6080901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13/2015 08:30 AM, Stephen Warren wrote:
> On 05/13/2015 08:09 AM, Simon Glass wrote:
>> There is a TPM on I2C3, so set up the pinmux for that.
>
> [Dropping LKML; they won't have a clue what this patch is about since
> it's not an in-kernel tool. Adding linux-tegra mailing list since that's
> where these patches are usually sent. Hence, maintaining quote of the
> entire patch.]
>
> This looks reasonable. I'll apply it Friday assuming no objections from
> anyone (I know some people in Europe are on holiday Thursday and likely
> left already today).

I've applied this.
