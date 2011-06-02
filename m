From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 3/3] ARM:Tegra: Device Tree Support: Initialize from wm8903
 the device tree
Date: Thu, 2 Jun 2011 10:46:18 -0600
Message-ID: <BANLkTimqf+BC=R3qRn3z3eKOjNXohGUsHA@mail.gmail.com>
References: <20110511231905.10362.12844.stgit@riker> <20110511232711.10362.53256.stgit@riker>
 <20110512074917.GA16250@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110512074917.GA16250-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2011 at 1:49 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, May 11, 2011 at 04:27:18PM -0700, John Bonesio wrote:
>> - =A0 =A0 if (pdata && pdata->gpio_base)
>> + =A0 =A0 wm8903->gpio_chip.base =3D -1;
>> + =A0 =A0 if (pdata && pdata->gpio_base) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D pdata->gpio_b=
ase;
>> - =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D -1;
>> + =A0 =A0 } else if (codec->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(codec->dev->of_no=
de, "gpio-base", NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (prop)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D=
 be32_to_cpup(prop);
>> + =A0 =A0 }
>
> We have to do manual endianness conversions to read from the device
> tree? =A0Oh, well.

Yeah, it's not great.  I'd really like to have a set of helper
functions that locate and decode the data for the most common types of
properties, but I've not sat down to focus on it and I've not seen a
pattern I'm happy with yet.  It does need to be solved though.  The
issue is I want something that handles fetching the property, error
checking and decoding, all in a consistent way so that it actually
reduces the amount of parsing code required.

Perhaps something like:

/* Not sure about this; in this case the return value is an error code
so that bad properties can be detected */
int dt_decode_cell(struct *property, int index, u32 *out_val);
int dt_decode_string(struct *property, int index, char **out_val);
int dt_decode_number(struct *property, int start, int len, unsigned
long long *out_val);

and perhaps a set of companion functions:
int dt_get_prop_cell(struct *device_node, char *propname, int index,
u32 *out_val);
int dt_get_prop_string(struct *device_node, char *propname, int index,
char **out_val);
int dt_get_prop_number(struct *device_node, char *propname, int start,
int len, unsigned long long *out_val);

The first set would be used when the property pointer has already be
obtained, and multiple datum need to be extracted.  The second would
be most useful when only one value will be extracted from a property.
I'm not totally happy with returning the value via a passed in pointer
though.  Thoughts?

g.
