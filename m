Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D47C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 09:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C2C92068E
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 09:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CoU6Nc6E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgJBJIf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 05:08:35 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9002 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJIf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 05:08:35 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76ee060000>; Fri, 02 Oct 2020 02:08:22 -0700
Received: from [10.25.97.216] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 09:08:27 +0000
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <87362xkxdv.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <25771697-fc85-b377-ae99-a5e0957ba02d@nvidia.com>
Date:   Fri, 2 Oct 2020 14:38:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87362xkxdv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601629702; bh=Kt+g9/UZmAGL50310mcza+eVE1I97Du/ixdvc4G5b90=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=CoU6Nc6E5XAEn7LDW3584duRTi+jbqtjHwa1bGmSK1fHiuF8illbTNO9rdhzOjBVc
         MEqT+EhBJ291p14rpPWSDYbR9XIFtCoqGRFyamcUONcj2q5cSJCjNga/pXndfYxjOT
         xDRszAmKPJoPCxcpINfX41gYBogY9CkpexNbSnTIyzUYacfoO9oTflLL8PwhS9A4ps
         Uc7Ljz1YQpqoppZcK+yxp/tK9bx89ol0famGdtR/7g8nqDA9n73gsII6Pzdlhun+Sw
         Tq18T6730YJjY8vyWwM7ymDA+tUNWqWbVzdI3gGhXWs5Kj5/FCbYZasxKKpvnPo9q4
         uXZWexFlHkHiw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>> Add Tegra audio machine driver which is based on generic audio graph car=
d
>> driver. It re-uses most of the common stuff from audio graph driver and
>> uses the same DT binding. Required Tegra specific customizations are don=
e
>> in the driver.
> (snip)
>> +static const struct snd_soc_ops tegra_audio_graph_ops =3D {
>> +     .startup        =3D asoc_simple_startup,
>> +     .shutdown       =3D asoc_simple_shutdown,
>> +     .hw_params      =3D tegra_audio_graph_hw_params,
>> +};
> This is just an idea,
> but can we use hooks here somehow ?
>
>          .ops_hook_pre
>          .ops_hook_func
>          .ops_hook_post
>
>          if (priv->ops_hook_pre->func)
>                  priv->ops_hook_pre->func_pre(...);
>
>          if (priv->ops_hook_func->func)
>                  priv->ops_hook_func->func(...); /* driver's function */
>          else
>                  graph_func(...);        /* audio-graph function */
>
>          if (priv->ops_hook_post->func)
>                  priv->ops_hook_post->func(...);

Right now I just required to populate some flags or structures and do=20
not have any specific pre()/post() functions to be called. Can this be=20
reserved for later?

>
>
>> +static int tegra_audio_graph_probe(struct platform_device *pdev)
>> +{
>> +     struct asoc_simple_priv *priv;
>> +     struct device *dev =3D &pdev->dev;
>> +     struct snd_soc_card *card;
>> +     struct link_info li;
>> +     int err;
>> +
>> +     /* Allocate the private data and the DAI link array */
>> +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +     if (!priv)
>> +             return -ENOMEM;
>> +
>> +     priv->data =3D (struct tegra_audio_graph_data *)
>> +             devm_kzalloc(dev, sizeof(*priv->data), GFP_KERNEL);
>> +     if (!priv->data)
>> +             return -ENOMEM;
>> +
>> +     card =3D simple_priv_to_card(priv);
>> +
>> +     card->owner =3D THIS_MODULE;
>> +     card->dev =3D dev;
>> +     card->component_chaining =3D true;
>> +     card->probe =3D tegra_audio_graph_card_probe;
>> +
>> +     priv->ops =3D &tegra_audio_graph_ops;
>> +     priv->force_dpcm =3D 1;
>> +
>> +     memset(&li, 0, sizeof(li));
>> +     graph_get_dais_count(priv, &li);
>> +     if (!li.link || !li.dais)
>> +             return -EINVAL;
>> +
>> +     err =3D asoc_simple_init_priv(priv, &li);
>> +     if (err < 0)
>> +             return err;
>> +
>> +     err =3D graph_parse_of(priv);
>> +     if (err < 0) {
>> +             if (err !=3D -EPROBE_DEFER)
>> +                     dev_err(dev, "Parse error %d\n", err);
>> +             goto cleanup;
>> +     }
>> +
>> +     snd_soc_card_set_drvdata(card, priv);
>> +
>> +     asoc_simple_debug_info(priv);
>> +
>> +     err =3D devm_snd_soc_register_card(dev, card);
>> +     if (err < 0)
>> +             goto cleanup;
>> +
>> +     return 0;
>> +
>> +cleanup:
>> +     asoc_simple_clean_reference(card);
>> +
>> +     return err;
>> +}

> These are almost same as graph_probe().
> Maybe we can separate graph_probe() and export function ?

Yes possible, I can move more stuff into graph_parse_of() which is=20
already an exported function in the current series. This can be utilized=20
by both generic audio graph and Tegra audio graph.

Something like below,

static int tegra_audio_graph_probe(struct platform_device *pdev)
{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_audio_priv *priv;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->d=
ev;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv =3D devm_kzalloc(dev, size=
of(*priv), GFP_KERNEL);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!priv)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENOMEM;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card =3D simple_priv_to_card(&p=
riv->simple);

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card->owner =3D THIS_MODULE;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card->dev =3D dev;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card->probe =3D tegra_audio_gra=
ph_card_probe;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* graph_parse_of() depends on =
below */
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card->component_chaining =3D 1;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->simple.ops =3D &tegra_aud=
io_graph_ops;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->simple.force_dpcm =3D 1;

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return graph_parse_of(&priv->si=
mple);
}

Does this sound fine?

