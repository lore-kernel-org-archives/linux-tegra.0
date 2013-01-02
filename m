From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Wed, 02 Jan 2013 17:31:03 +0800
Message-ID: <50E3FE57.5070702@gmail.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com> <50E3E45A.5050003@gmail.com> <50E3FE8C.8000309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E3FE8C.8000309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 05:31 PM, Terje Bergstr=F6m wrote:
> On 02.01.2013 09:40, Mark Zhang wrote:
>> On 12/21/2012 07:39 PM, Terje Bergstrom wrote:
>>> Add support for host1x client modules, and host1x channels to submi=
t
>>> work to the clients. The work is submitted in GEM CMA buffers, so
>>> this patch adds support for them.
>>>
>>> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>> [...]
>>> +/*
>>> + * Begin a cdma submit
>>> + */
>>> +int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job =
*job)
>>> +{
>>> +	struct host1x *host1x =3D cdma_to_host1x(cdma);
>>> +
>>> +	mutex_lock(&cdma->lock);
>>> +
>>> +	if (job->timeout) {
>>> +		/* init state on first submit with timeout value */
>>> +		if (!cdma->timeout.initialized) {
>>> +			int err;
>>> +			err =3D host1x->cdma_op.timeout_init(cdma,
>>> +					job->syncpt_id);
>>> +			if (err) {
>>> +				mutex_unlock(&cdma->lock);
>>> +				return err;
>>> +			}
>>> +		}
>>> +	}
>>> +	if (!cdma->running)
>>> +		host1x->cdma_op.start(cdma);
>>> +
>>> +	cdma->slots_free =3D 0;
>>> +	cdma->slots_used =3D 0;
>>> +	cdma->first_get =3D host1x->cdma_pb_op.putptr(&cdma->push_buffer)=
;
>>> +
>>> +	trace_host1x_cdma_begin(job->ch->dev->name);
>>
>> Seems missing "mutex_unlock(&cdma->lock);" here.
>=20
> That's intentional. Writing a job to channel is atomic, so lock is ta=
ken
> from host1x_cdma_begin() until host1x_cdma_end().
>=20

Okay. So can we consider that lock and unlock this mutex in the functio=
n
which calls host1x_cdma_begin and host1x_cdma_end, that means, in
current implementation, function "channel_submit"?

Mark
> Terje
>=20
