From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] Staging: nvec: nvec: fixed check style issues
Date: Mon, 17 Dec 2018 09:16:40 +0100
Message-ID: <20181217081640.GA16368@kroah.com>
References: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
Cc: marvin24@gmx.de, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 16, 2018 at 08:57:43AM -0800, Amir Mahdi Ghorbanian wrote:
> @@ -626,7 +628,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(0, 33);

Why is this a valid range to sleep for for this device?  Have you been
able to verify/test this?

thanks,

greg k-h
