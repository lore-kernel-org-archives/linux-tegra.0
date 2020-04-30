From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 30 Apr 2020 12:27:52 -0700
Message-ID: <10286a40-ed3c-1999-68fa-7099130a2423@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/30/20 6:34 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +	struct tegra_csi *csi =3D host1x_client_to_csi(client);
>> +	struct tegra_video_device *vid =3D dev_get_drvdata(client->host);
>> +	int ret;
>> +
>> +	INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +	ret =3D tegra_csi_tpg_channels_alloc(csi);
>> +	if (ret < 0) {
>> +		dev_err(csi->dev,
>> +			"failed to allocate tpg channels: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret =3D tegra_csi_channels_init(csi);
>> +	if (ret < 0)
>> +		goto cleanup;
>> +
>> +	vid->csi =3D csi;
>> +
>> +	return 0;
>> +
>> +cleanup:
>> +	tegra_csi_channels_cleanup(csi);
>> +	pm_runtime_put_sync(csi->dev);
> This pm_runtime_put_sync() should be removed.

Sorry, I had it correct in follow-up patches and missed this to remove=20
in v12.

Will double check all changes before sending v12 once all v11 feedback=20
from you is done.

>
>> +	return ret;
>> +}
