From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/tegra: Check size of a submitted command buffer
Date: Fri, 12 May 2017 22:14:53 +0300
Message-ID: <1ce8aacd-f183-259b-bb1b-b9ff39584f80@gmail.com>
References: <20170512190212.17798-1-digetx@gmail.com>
 <CABPQNSa8d+ZUpNFiLFdNhnYiQ+dE9=0GQdouCWxX=6C9je9zcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPQNSa8d+ZUpNFiLFdNhnYiQ+dE9=0GQdouCWxX=6C9je9zcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12.05.2017 22:06, Erik Faye-Lund wrote:
> On Fri, May 12, 2017 at 9:02 PM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> +               if (cmdbuf.words * 4 > gem->size) {
> 
> Shouldn't this be "cmdbuf.offset + cmdbuf.words * 4 > gem->size"?
> 

Seems yes, good catch. Thank you :)

-- 
Dmitry
