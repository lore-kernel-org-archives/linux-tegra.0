From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] Staging: nvec: nvec: fixed check style issues
Date: Sun, 16 Dec 2018 09:47:23 -0800
Message-ID: <1bfa8186371146e05bc0d84e308e0e08115236d5.camel@perches.com>
References: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>, marvin24@gmx.de
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Sun, 2018-12-16 at 08:57 -0800, Amir Mahdi Ghorbanian wrote:
> Fixed an endline open parenthesis issue and replaced udelay() by the
> preferred usleep_range() function.

Not all checkpatch bleats need to be fixed.

Function names with 40+ character length identifiers makes
fitting within an 80 column limit nearly impossible.

> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
[]
> @@ -382,8 +382,10 @@ static void nvec_request_master(struct work_struct *work)
>  		msg = list_first_entry(&nvec->tx_data, struct nvec_msg, node);
>  		spin_unlock_irqrestore(&nvec->tx_lock, flags);
>  		nvec_gpio_set_value(nvec, 0);
> -		err = wait_for_completion_interruptible_timeout(
> -				&nvec->ec_transfer, msecs_to_jiffies(5000));
> +		done = &nvec->ec_transfer;
> +		timeout = msecs_to_jiffies(5000);
> +		err = wait_for_completion_interruptible_timeout(done,
> +								timeout);

This was easier to read without the temporaries.
And where are done and timeout declared?

Please compile your patches before submitting them.
