From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Subject: Re: [RFC,v2,1/8] video: tegra: Add nvhost driver
Date: Mon, 10 Dec 2012 12:28:24 +0200
Message-ID: <50C5B948.5090203@nvidia.com>
References: <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <50B72696.3030205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B72696.3030205@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <nvmarkzhang@gmail.com>
Cc: "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 29.11.2012 11:10, Mark Zhang wrote:
>> +
>> +/**
>> + * Write a cpu syncpoint increment to the hardware, without touching
>> + * the cache. Caller is responsible for host being powered.
>> + */
>> +static void host1x_syncpt_cpu_incr(struct nvhost_syncpt *sp, u32 id)
>> +{
>> +     struct nvhost_master *dev = syncpt_to_dev(sp);
>> +     u32 reg_offset = id / 32;
>> +
>> +     if (!nvhost_module_powered(dev->dev)) {
>> +             dev_err(&syncpt_to_dev(sp)->dev->dev,
>> +                     "Trying to access host1x when it's off");
>> +             return;
>> +     }
>> +
>> +     if (!nvhost_syncpt_client_managed(sp, id)
>> +                     && nvhost_syncpt_min_eq_max(sp, id)) {
>> +             dev_err(&syncpt_to_dev(sp)->dev->dev,
>> +                     "Trying to increment syncpoint id %d beyond max\n",
>> +                     id);
>> +             return;
>> +     }
>> +     writel(BIT_MASK(id), dev->sync_aperture +
>> +                     host1x_sync_syncpt_cpu_incr_r() + reg_offset * 4);
> 
> I have a stupid question: According to the name and the context of this
> function, seems it increases the syncpt value which specified by param
> "id". So how does this "writel" increase the value? I don't know much
> about host1x/syncpt reg operations, so could you explain a little bit or
> I just completely have a wrong understanding?

I believe I've implemented most of the requests in this mail, but I seem
to have missed answering this question.

writel() to that register invokes a method in host1x, which increments
the sync point indicated by the value of the register by one.

Best regards,
Terje
