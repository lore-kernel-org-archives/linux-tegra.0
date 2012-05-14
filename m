From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] printk: Make it compile with !CONFIG_PRINTK
Date: Mon, 14 May 2012 09:46:27 -0700
Message-ID: <1337013987.29436.16.camel@joe2Laptop>
References: <1337012284-18680-1-git-send-email-hdoyu@nvidia.com>
	 <CAPXgP11SJQWkfAOidv2nFXAAWxOmjeBpd_uZSCgjX+7+qSH9nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPXgP11SJQWkfAOidv2nFXAAWxOmjeBpd_uZSCgjX+7+qSH9nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-05-14 at 18:20 +0200, Kay Sievers wrote:
> On Mon, May 14, 2012 at 6:18 PM, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Add missing prepend_timestamp() dummy.
> 
> That was fixed already last week:
> http://git.kernel.org/?p=linux/kernel/git/gregkh/driver-core.git;a=commitdiff;h=1fce677971e29ceaa7c569741fa9c685a7b1052a

Yup, but in my opinion, this particular fix shouldn't be
necessary because the CONFIG_PRINTK bits should have better
code separation.

None of the code that calls prepend_timestamp should
actually be compiled in when !CONFIG_PRINTK.

The same is true for unnecessary uses like the existing
per-cpu:

static DEFINE_PER_CPU(int, printk_pending);
static DEFINE_PER_CPU(char [PRINTK_BUF_SIZE], printk_sched_buf);
 
After this patchset is accepted into mainline, I'll revive
the modularization and move of kernel/printk.c and associated
files into -> kernel/printk/* patch I did awhile ago.

I'll follow-on to this message with the original patches
just as an fyi/rfc.

cheers, Joe
