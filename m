From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V5 1/9] gpio: tegra: add gpio wakeup source handling
Date: Wed, 03 Apr 2013 15:20:01 -0600
Message-ID: <515C9D01.8090800@wwwdotorg.org>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com> <1364901613-25080-2-git-send-email-josephl@nvidia.com> <CACRpkdYOLuUyBu7ER7hqLGZnAoYS0Z7XJ6LC2=ec3vxKzF1rqA@mail.gmail.com> <515C5E43.1080904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515C5E43.1080904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 10:52 AM, Stephen Warren wrote:
> On 04/03/2013 10:29 AM, Linus Walleij wrote:
>> On Tue, Apr 2, 2013 at 1:20 PM, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> This patch ad
>> d the gpio wakeup source handling for the Tegra platform. It
>>> was be done by enabling the irq for the gpio in the gpio controller and
>>> enabling the bank irq of the gpio in the Tegra legacy irq controller when
>>> the system going to suspend.
>>>
>>> Based on the work by:
>>> Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>> V5:
>>> * no change
>>> V4:
>>> * no change
>>> V3:
>>> * no change
>>> V2:
>>> * no change
>>
>> Shall I just apply this to the GPIO tree to stop these repetitive mails
>> from coming?
> 
> It's part of a series where other patches are being rev'd. I'll apply it
> to the Tegra tree with the series once it's final.

By the way, it's checked in now, so there won't be any more versions posted.

I guess I should have just applied this patch in an earlier iteration
since it was ack'd and only later patches in the series needed changes.
