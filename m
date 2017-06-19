From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 3/6] reset: hide reset control arrays behind struct
 reset_control
Date: Mon, 19 Jun 2017 14:18:33 +0200
Message-ID: <1497874713.2993.70.camel@pengutronix.de>
References: <20170601165203.15315-1-p.zabel@pengutronix.de>
         <20170601165203.15315-4-p.zabel@pengutronix.de>
         <c15af5af-3b30-07eb-52c8-af0aff87f3b4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c15af5af-3b30-07eb-52c8-af0aff87f3b4@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Vivek,

On Tue, 2017-06-13 at 12:16 +0530, Vivek Gautam wrote:
[...]
> > @@ -102,18 +94,6 @@ static inline struct reset_control *__devm_reset_control_get(
> >   	return optional ? NULL : ERR_PTR(-ENOTSUPP);
> >   }
> >   
> > -static inline
> > -int reset_control_array_assert(struct reset_control_array *resets)
> > -{
> > -	return 0;
> > -}
> > -
> > -static inline
> > -int reset_control_array_deassert(struct reset_control_array *resets)
> > -{
> > -	return 0;
> > -}
> > -
> >   static inline struct reset_control_array *
> 
> This has to return just 'struct reset_control *'.
> That should resolve kbuild errors.
>
> Rest looks good to me.
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Thanks, I had already fixed this locally, prompted by the kbuild test
robot. I'll send a v6. I would like to merge this patch into the first
"reset: Add APIs to manage array of resets" patch, if that's ok with
you.

regards
Philipp
