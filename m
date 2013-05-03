From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH -next] staging: nvec: don't call input_free_device() after input_unregister_device()
Date: Fri, 03 May 2013 09:56:42 +0200
Message-ID: <1490353.qtoJzv77Qb@fb07-iapwap2.physik.uni-giessen.de>
References: <CAPgLHd_XHbS=RBxTJWgoJNm0MfQyzyx4Fr2OHrDCN9VKwOwakA@mail.gmail.com> <CALq1K=JiNqAH19H8C9EMFBjQOLJxSX7wwE28sxWRusk9a12YDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALq1K=JiNqAH19H8C9EMFBjQOLJxSX7wwE28sxWRusk9a12YDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, ac100 <ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Leon,

Am Donnerstag, 2. Mai 2013, 23:18:35 schrieb Leon Romanovsky:
> On Wed, Apr 24, 2013 at 5:47 AM, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> > 
> > input_free_device() should only be used if input_register_device()
> > was not called yet or if it failed. Once device was unregistered
> > use input_unregister_device() and memory will be freed once last
> > reference to the device is dropped.
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> > ---
> > 
> >  drivers/staging/nvec/nvec_kbd.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/nvec/nvec_kbd.c
> > b/drivers/staging/nvedx10c/nvec_kbd.c index 7445ce6..bdf5a64 100644
> > --- a/drivers/staging/nvec/nvec_kbd.c
> > +++ b/drivers/staging/nvec/nvec_kbd.c
> > 
> > @@ -170,7 +170,6 @@ fail:
> >  static int nvec_kbd_remove(struct platform_device *pdev)
> >  {
> >  
> >         input_unregister_device(keys_dev.input);
> > 
> > -       input_free_device(keys_dev.input);
> > 
> >         return 0;
> >  
> >  }
> 
> Hi Greg and Wei,
> I sent patch which converts nvec-kbd to managed device (devm_*), so
> this patch is not needed.

we should not confuse things again. I think Greg can merge the various patches 
(from Wei, me, and yours) in a first-come-first-serve order as he always does 
and resolve the (trivial) merge conflicts himself. I guess he won't respond 
until -rc1 is out. Beside this, I'm not sure if your patch can still go into 
3.10 so it may have to wait till 3.11.

Marc
