From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 1/9] gpio: tegra: add gpio wakeup source handling
Date: Wed, 3 Apr 2013 18:29:03 +0200
Message-ID: <CACRpkdYOLuUyBu7ER7hqLGZnAoYS0Z7XJ6LC2=ec3vxKzF1rqA@mail.gmail.com>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com>
	<1364901613-25080-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364901613-25080-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 2, 2013 at 1:20 PM, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This patch ad
d the gpio wakeup source handling for the Tegra platform. It
> was be done by enabling the irq for the gpio in the gpio controller and
> enabling the bank irq of the gpio in the Tegra legacy irq controller when
> the system going to suspend.
>
> Based on the work by:
> Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> V5:
> * no change
> V4:
> * no change
> V3:
> * no change
> V2:
> * no change

Shall I just apply this to the GPIO tree to stop these repetitive mails
from coming?

Yours,
Linus Walleij
