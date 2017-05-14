From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Check size of a submitted command buffer
Date: Sun, 14 May 2017 23:55:35 +0300
Message-ID: <43378998-e75f-90bb-eadc-f17da41acce9@gmail.com>
References: <20170512192903.25491-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170512192903.25491-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12.05.2017 22:29, Dmitry Osipenko wrote:
> If command buffer claims a number of words that is higher than its BO can
> fit and a relocation lays past the BO, a kernel OOPS will be fired on that
> relocation address patching. This was triggered by an opentegra Xorg driver
> that erroneously pushed too many commands to the pushbuf.
> 

For the record, this patch is superseded by the "drm/tegra: Check offsets of a
submitted command buffer and of relocations."

-- 
Dmitry
