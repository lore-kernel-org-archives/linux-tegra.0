From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/1] drm/tegra: Add guard to avoid double disable/enable
 of RGB outputs
Date: Tue, 11 Feb 2014 23:48:48 +0400
Message-ID: <52FA7EA0.6050509@gmail.com>
References: <1392138747-18198-1-git-send-email-digetx@gmail.com> <CABPQNSYNpwf_EQqUc2zpQ1cVQE++2ma-bR-rfQPdNoaJc07W4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABPQNSYNpwf_EQqUc2zpQ1cVQE++2ma-bR-rfQPdNoaJc07W4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kusmabite@gmail.com
Cc: thierry.reding@gmail.com, tbergstrom@nvidia.com, airlied@linux.ie, swarren@wwwdotorg.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.02.2014 23:13, Erik Faye-Lund =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tue, Feb 11, 2014 at 6:12 PM, Dmitry Osipenko <digetx@gmail.com> w=
rote:
>> Add guard to check whether RGB output is already enabled in the way =
it's
>> done for HDMI output. Fixes possible hang on trying to disable outpu=
t twice
>> (first time during driver probe and second on fb registering).
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/rgb.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb=
=2Ec
>> index 338f7f6..0266fb4 100644
>> --- a/drivers/gpu/drm/tegra/rgb.c
>> +++ b/drivers/gpu/drm/tegra/rgb.c
>> @@ -15,6 +15,7 @@
>>  struct tegra_rgb {
>>         struct tegra_output output;
>>         struct tegra_dc *dc;
>> +       bool enabled;
>>
>>         struct clk *clk_parent;
>>         struct clk *clk;
>> @@ -89,6 +90,9 @@ static int tegra_output_rgb_enable(struct tegra_ou=
tput *output)
>>         struct tegra_rgb *rgb =3D to_rgb(output);
>>         unsigned long value;
>>
>> +       if (rgb->enabled)
>> +               return 0;
>> +
>>         tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enab=
le));
>>
>>         value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
>> @@ -122,6 +126,8 @@ static int tegra_output_rgb_enable(struct tegra_=
output *output)
>>         tegra_dc_writel(rgb->dc, GENERAL_ACT_REQ << 8, DC_CMD_STATE_=
CONTROL);
>>         tegra_dc_writel(rgb->dc, GENERAL_ACT_REQ, DC_CMD_STATE_CONTR=
OL);
>>
>> +       rgb->enabled =3D true;
>> +
>>         return 0;
>>  }
>>
>> @@ -130,6 +136,9 @@ static int tegra_output_rgb_disable(struct tegra=
_output *output)
>>         struct tegra_rgb *rgb =3D to_rgb(output);
>>         unsigned long value;
>>
>> +       if (!rgb->enabled)
>> +               return 0;
>> +
>>         value =3D tegra_dc_readl(rgb->dc, DC_CMD_DISPLAY_POWER_CONTR=
OL);
>>         value &=3D ~(PW0_ENABLE | PW1_ENABLE | PW2_ENABLE | PW3_ENAB=
LE |
>>                    PW4_ENABLE | PM0_ENABLE | PM1_ENABLE);
>> @@ -144,6 +153,8 @@ static int tegra_output_rgb_disable(struct tegra=
_output *output)
>>
>>         tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_dis=
able));
>>
>> +       rgb->enabled =3D false;
>> +
>>         return 0;
>>  }
>>
>=20
> Wouldn't it make more sense to make "enabled" and int that counts how
> many times tegra_output_rgb_enable has been called? That way you can
> have tegra_output_rgb_disable only really disable the display once th=
e
> same amount of disables have been performed...
>=20
RGB is a part of DC, i.e. one per DC. tegra_output_rgb_enable() would b=
e called
for each individual DC, so it doesn't make any sense. Besides, I doubt =
tegra
device with two panels ever existed or will be :)
