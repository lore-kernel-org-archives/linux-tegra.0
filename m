From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Wed, 2 Jan 2013 11:43:51 +0200
Message-ID: <50E40157.9070902@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com> <50E3E45A.5050003@gmail.com> <50E3FE8C.8000309@nvidia.com> <50E3FE57.5070702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E3FE57.5070702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02.01.2013 11:31, Mark Zhang wrote:
> On 01/02/2013 05:31 PM, Terje Bergstr=F6m wrote:
>> That's intentional. Writing a job to channel is atomic, so lock is t=
aken
>> from host1x_cdma_begin() until host1x_cdma_end().
>>
>=20
> Okay. So can we consider that lock and unlock this mutex in the funct=
ion
> which calls host1x_cdma_begin and host1x_cdma_end, that means, in
> current implementation, function "channel_submit"?

Yes, exactly.

Terje
