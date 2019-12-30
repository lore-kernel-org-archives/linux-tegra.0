From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 13/16] usb: phy: tegra: Keep CPU interrupts enabled
Date: Mon, 30 Dec 2019 21:36:48 +0100
Message-ID: <20191230203648.GA24135@qmqm.qmqm.pl>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191228203358.23490-14-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 28, 2019 at 11:33:55PM +0300, Dmitry Osipenko wrote:
> There is no good reason for disabling of CPU interrupts in order to
> protect the utmip_pad_count modification.

Since there are sleeping functions called outside of the locked sections,
this should be a mutex instead. OTOH if the spin_lock is to protect register
write against IRQ handler, then the patch is wrong.

[...]
> -	spin_unlock_irqrestore(&utmip_pad_lock, flags);
> +	spin_unlock(&utmip_pad_lock);
>  
>  	clk_disable_unprepare(phy->pad_clk);

Best Regards,
Micha³ Miros³aw
