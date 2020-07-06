From: Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 08:26:56 -0700
Message-ID: <ea69a0f8-af48-45a3-7969-c38e0f785599@intel.com>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
 <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
 <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Qian Cai <cai-J5quhbR+WMc@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 7/6/2020 8:24 AM, Arnd Bergmann wrote:
> On Mon, Jul 6, 2020 at 5:01 PM Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>> On 7/6/2020 5:53 AM, Arnd Bergmann wrote:
>>> On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> Arnd,
>> I'm looking at the pl001_dma_probe(), I think we could make it more robust if it
>> uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I
>> suppose looking at the comment header for dma_request_chan() it does say return
>> chan ptr or error ptr. Sorry I missed that.
> 
> No. IS_ERR_OR_NULL() is almost always a mistake. A function should either
> return NULL on error, or it should return an error code, but should not be
> able to return either.

Fair enough.

> 
> Have you checked all the other 'return NULL' statements in your patch to
> ensure that they never return error pointers?

Yeah I looked over the rest of them. The ones that are returning NULL as far as 
I can tell are expected to return NULL.

> 
>         Arnd
> 
