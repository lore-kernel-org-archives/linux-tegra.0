From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple@vodafone.de>
Subject: Re: [PATCH 2/2] drm: tegra: Add HDMI support
Date: Fri, 09 Nov 2012 17:00:54 +0100
Message-ID: <509D28B6.3060207@vodafone.de>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de> <1352469579-3337-3-git-send-email-thierry.reding@avionic-design.de> <CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, linux-tegra@vger.kernel.org, Dave Airlie <airlied@redhat.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 09.11.2012 16:45, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/11/9 Thierry Reding <thierry.reding@avionic-design.de>:
>> +/* all fields little endian */
>> +struct hdmi_audio_infoframe {
>> +       /* PB0 */
>> +       u8 csum;
>> +
>> +       /* PB1 */
>> +       unsigned cc:3; /* channel count */
>> +       unsigned res1:1;
>> +       unsigned ct:4; /* coding type */
>> +
>> +       /* PB2 */
>> +       unsigned ss:2; /* sample size */
>> +       unsigned sf:3; /* sample frequency */
>> +       unsigned res2:3;
>> +
>> +       /* PB3 */
>> +       unsigned cxt:5; /* coding extention type */
>> +       unsigned res3:3;
>> +
>> +       /* PB4 */
>> +       u8 ca; /* channel/speaker allocation */
>> +
>> +       /* PB5 */
>> +       unsigned res5:3;
>> +       unsigned lsv:4; /* level shift value */
>> +       unsigned dm_inh:1; /* downmix inhibit */
>> +
>> +       /* PB6-10 reserved */
>> +       u8 res6;
>> +       u8 res7;
>> +       u8 res8;
>> +       u8 res9;
>> +       u8 res10;
>> +} __packed;
> I was told it won't work on different endian devices. See
> [RFC][PATCH] drm/radeon/hdmi: define struct for AVI infoframe
> http://lists.freedesktop.org/archives/dri-devel/2012-May/022544.html

Yeah, that's indeed true. And honestly adding just another=20
implementation of the HDMI info frames sounds like somebody should=20
finally sit down and implement it in a common drm_hdmi.c

Regards,
Christian.
