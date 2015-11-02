From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 0/8] Add support for NVIDIA Tegra XUSB
Date: Mon, 2 Nov 2015 10:20:38 -0700
Message-ID: <56379B66.8000401@wwwdotorg.org>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/02/2015 04:55 AM, Martyn Welch wrote:
> This series is based on commits that can be found in the git tree here:
>
> https://github.com/thierryreding/linux/commits/staging/xhci
>
> I have included the patches I've used from that tree as patches 1-5.
>
> The above patches were submitted for review back in May:
>
> https://lkml.org/lkml/2015/5/4/574

Let's hold off on any XUSB driver submissions. We need to sort out what 
we want the DT binding to look like first. Hopefully Thierry will be 
posting revised XUSB PADCTL and XUSB bindings in the near future. Once 
that's finalized, then we can look at drivers that implement them.
