From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 04/12] firmware: tegra: Add IVC library
Date: Mon, 22 Aug 2016 12:49:03 -0600
Message-ID: <a11ba4fb-5be5-7b26-164d-63831d8891c7@wwwdotorg.org>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819173233.13260-5-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2016 11:32 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The Inter-VM communication (IVC) is a communication protocol which is
> designed for interprocessor communication (IPC) or the communication
> between the hypervisor and the virtual machine with a guest OS.
>
> Message channels are used to communicate between processors. They are
> backed by DRAM or SRAM, so care must be taken to maintain coherence of
> data.
>
> The IVC library maintains memory-based descriptors for the transmission
> and reception channels as well as the data coherence of the counter and
> payload. Clients, such as the driver for the BPMP firmware, can use the
> library to exchange messages with remote processors.
>
> Based on work by Peter Newman <pnewman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> and Joseph Lo
> <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

All the renaming/restructuring relative to the internal code made 
comparing them a bit more difficult that I'd like...
