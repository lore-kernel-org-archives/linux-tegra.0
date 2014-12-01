From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [RESEND PATCH nouveau 3/3] volt: add support for GK20A
Date: Tue, 02 Dec 2014 00:00:09 +0100
Message-ID: <547CF2F9.6040905@free.fr>
References: <1417173180-21726-1-git-send-email-vinceh@nvidia.com> <1417173180-21726-3-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417173180-21726-3-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28/11/2014 12:13, Vince Hsu wrote:
> The voltage value are calculated by the hardware characterized
> result.
>
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> Resend this patch with the fuse change and proper patch prefix
> per Thierry's request.
Since the voltage table really is per-chipset, it would be insane
to add that to the DT. If it was not the case, it is still easier to
move to the DT instead of doing the opposite.

Acked-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
