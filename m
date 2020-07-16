From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add the GPU on Tegra194
Date: Thu, 16 Jul 2020 08:05:24 -0700
Message-ID: <4f9cfab5-2a5d-379c-ba17-1aca896b4110@nvidia.com>
References: <20200716120138.532906-1-thierry.reding@gmail.com>
 <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
 <20200716131753.GG535268@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716131753.GG535268@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Debarshi Dutta <ddutta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 7/16/2020 6:17 AM, Thierry Reding wrote:
> On Thu, Jul 16, 2020 at 01:59:33PM +0100, Jon Hunter wrote:
>> I also see that for gv11b we populate 'dma-coherent' and so we should
>> probably add this as well.
> Do we know for certain that the GPU is DMA coherent? I've only tested
> this (with local patches to Nouveau) without dma-coherent, so I have not
> actually verified that it works without.
>
> I vaguely recall reading that there are different apertures for sysmem,
> one for coherent sysmem and another for non-coherent sysmem. So I'm not
> sure if dma-coherent here will work without additional code in the
> driver to ensure that all memory is allocated from the coherent sysmem
> aperture.

We do have the choices of coherent and non-coherent memory accesses in 
the iGPU via the two sysmem apertures. But in Tegra194 we're forcing 
coherency from the memory subsystem side, so all accesses are coherent.

Terje
