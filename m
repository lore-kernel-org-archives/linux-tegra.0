From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5] hwmon: (lm90) split set&show temp as common codes
Date: Wed, 22 Apr 2015 09:57:27 +0800
Message-ID: <55370007.5030408@nvidia.com>
References: <1381215866-20608-1-git-send-email-wni@nvidia.com> <20131011091741.59cdaf31@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131011091741.59cdaf31-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
Cc: "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Jean
Sorry to trouble you, I recalled that you had applied this change, but =
I still
can't find it in the mainline.
Could you please check it or does I need to do anything else?

Thanks.
Wei.

On 2013=E5=B9=B410=E6=9C=8811=E6=97=A5 15:17, Jean Delvare wrote:
> On Tue, 8 Oct 2013 15:04:26 +0800, Wei Ni wrote:
>> Split set&show temp codes as common functions, so we can use it
>> directly when implement linux thermal framework.
>> And handle error return value for the lm90_select_remote_channel
>> and write_tempx, then set_temp8 and set_temp11 could return it
>> to user-space.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/hwmon/lm90.c |  166 ++++++++++++++++++++++++++++++++++-----=
-----------
>>  1 file changed, 113 insertions(+), 53 deletions(-)
>> (...)
>=20
> Applied with minor edits, thanks.
>=20
