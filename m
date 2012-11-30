From: Mark Zhang <nvmarkzhang@gmail.com>
Subject: Re: [RFC,v2,3/8] video: tegra: host: Add channel and client support
Date: Fri, 30 Nov 2012 14:13:36 +0800
Message-ID: <50B84E90.6090103@gmail.com>
References: <1353935954-13763-4-git-send-email-tbergstrom@nvidia.com> <50B7325F.20002@gmail.com> <50B73D1E.5090600@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B73D1E.5090600@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Cc: "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/29/2012 06:46 PM, Terje Bergstr=C3=B6m wrote:
> On 29.11.2012 12:01, Mark Zhang wrote:
>>
>> Just for curious, why "pb->mapped + 1K" is the end of a 4K pushbuffe=
r?
>=20
> pb->mapped is u32 *, so compiler will take care of multiplying by
> sizeof(u32).
>=20

Ah, yes. Sorry, I must be insane at that time. :)

>>> +unsigned int nvhost_cdma_wait_locked(struct nvhost_cdma *cdma,
>>> +		enum cdma_event event)
>>> +{
>>> +	for (;;) {
>>> +		unsigned int space =3D cdma_status_locked(cdma, event);
>>> +		if (space)
>>> +			return space;
>>> +
>>> +		/* If somebody has managed to already start waiting, yield */
>>> +		if (cdma->event !=3D CDMA_EVENT_NONE) {
>>> +			mutex_unlock(&cdma->lock);
>>> +			schedule();
>>> +			mutex_lock(&cdma->lock);
>>> +			continue;
>>> +		}
>>> +		cdma->event =3D event;
>>> +
>>> +		mutex_unlock(&cdma->lock);
>>> +		down(&cdma->sem);
>>> +		mutex_lock(&cdma->lock);
>>
>> I'm newbie of nvhost but I feel here is very tricky, about the lock =
and
>> unlock of this mutex: cdma->lock. Does it require this mutex is lock=
ed
>> before calling this function? And do we need to unlock it before the
>> code: "return space;" above? IMHO, this is not a good design and can=
 we
>> find out a better solution?
>=20
> Yeah, it's not perfect and good solutions are welcome.
> cdma_status_locked() must be called with a mutex. But, what we genera=
lly
> wait for is for space in push buffer. The cleanup code cannot run if =
we
> keep cdma->lock, so I release it.
>=20
> The two ways to loop are because there was a race between two process=
es
> waiting for space. One of them set cdma->event to indicate what it's
> waiting for and can go to sleep, but the other has to keep spinning.
>=20

Alright. I just feel this mutex operations is complicated and
error-prone, but I just get the big picture of nvhost and still don't
know much about a lot of details. So I'll let you know if I find some
better solutions.

> Terje
>=20
