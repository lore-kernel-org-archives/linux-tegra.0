Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gk/9z0LA"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8FBAD
	for <linux-tegra@vger.kernel.org>; Tue, 12 Dec 2023 22:37:08 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54cd8f5bb5cso8344955a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 12 Dec 2023 22:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702449426; x=1703054226; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiVWYZ/VHGjewdIh92D/rkp5vMzLkVA7VJu78RFLjBo=;
        b=Gk/9z0LAiTkn/a5ql7sFWYjGz+h90MVMBRSguS8g3ML73akDtSXUlfENlre1N1sbKO
         bHjLJ1J0Re+8cTEBUa8RebZo7WGEwtFZSdMtC6SZzkaXFu3oaHrMsf7PHnaEt1yZJPD6
         iTaGvLZRypJV2+iKDU8d5st0V7QKSmywwJ3xzL9CWOL39kPoJE0yMY715W5SfzTS/fbb
         ypbSDCrxARgwFoE0xpLZVrqrYMRLdx1bji4EMouT5JYEl7CkcSicES2B9D9z6y5ootqV
         zmBzvn3pj+WeMeHGKFcZG6H9HXLJHXRiSXOmBpuc1klvGYboinGTrTlB2J4ZrNgO1GGw
         5S/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449426; x=1703054226;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiVWYZ/VHGjewdIh92D/rkp5vMzLkVA7VJu78RFLjBo=;
        b=Qi9+J4U8urnsy6iOTE4tewBQHwFbVabsH9NPGUKBmCk/X5/GR84fQLvplIE8rMlbvM
         hCYGHu3O5GirEoTNAEDHioMXIqEI4LrystmTkrHVJfqoOVoGYmAfWJ6YccNfimrlPR7X
         ItkpNe4PEk/ARt+4e50LD/kmNq8Qa0vBg1cNjbt4hxiTdln7KB9kZeqzLdXdMh1F0XqB
         qWftKEdES3271PH/Pia5CKB+xY2OkSIMAlsI0ulSZA7P6M08wXv0VpVurnu5T73biflD
         KtzJ/0Ci8olwdcIUjGVF4knWW8KiU2RXce1uxzOnkXeQOK7LJZVrJEYd/lFVxd4cwdF4
         fErg==
X-Gm-Message-State: AOJu0Yyb/TeAyduiG/UyGuTT8Pl0ikF8kV0UvPgHRuLCIYFntdEwIBoJ
	ZY0LN5RnYIMSwWMWyJtvAmTw2w==
X-Google-Smtp-Source: AGHT+IGfVpzGzxTJvbe9Y0ofX7JUYkeqsL0M5Mdt14uiJr8kkcFqQYX26kqgUbrKB4gqwtTHdEyZDA==
X-Received: by 2002:a50:d0c8:0:b0:551:d08e:782d with SMTP id g8-20020a50d0c8000000b00551d08e782dmr699728edf.6.1702449426617;
        Tue, 12 Dec 2023 22:37:06 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id a15-20020a50c30f000000b0054bde4df7f0sm5512866edb.66.2023.12.12.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:37:06 -0800 (PST)
Date: Wed, 13 Dec 2023 09:37:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mkumard@nvidia.com
Cc: linux-tegra@vger.kernel.org
Subject: [bug report] dmaengine: tegra210-adma: Support dma-channel-mask
 property
Message-ID: <9aeefd2b-2ba7-40be-9b0e-564cfd4ece6f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mohan Kumar,

The patch 25b636225a08: "dmaengine: tegra210-adma: Support
dma-channel-mask property" from Nov 28, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/dma/tegra210-adma.c:887 tegra_adma_probe()
	warn: passing casted pointer 'tdma->dma_chan_mask' to 'of_property_read_u32_array()' 64 vs 32.

drivers/dma/tegra210-adma.c
    845 static int tegra_adma_probe(struct platform_device *pdev)
    846 {
    847         const struct tegra_adma_chip_data *cdata;
    848         struct tegra_adma *tdma;
    849         int ret, i;
    850 
    851         cdata = of_device_get_match_data(&pdev->dev);
    852         if (!cdata) {
    853                 dev_err(&pdev->dev, "device match data not found\n");
    854                 return -ENODEV;
    855         }
    856 
    857         tdma = devm_kzalloc(&pdev->dev,
    858                             struct_size(tdma, channels, cdata->nr_channels),
    859                             GFP_KERNEL);
    860         if (!tdma)
    861                 return -ENOMEM;
    862 
    863         tdma->dev = &pdev->dev;
    864         tdma->cdata = cdata;
    865         tdma->nr_channels = cdata->nr_channels;
    866         platform_set_drvdata(pdev, tdma);
    867 
    868         tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
    869         if (IS_ERR(tdma->base_addr))
    870                 return PTR_ERR(tdma->base_addr);
    871 
    872         tdma->ahub_clk = devm_clk_get(&pdev->dev, "d_audio");
    873         if (IS_ERR(tdma->ahub_clk)) {
    874                 dev_err(&pdev->dev, "Error: Missing ahub controller clock\n");
    875                 return PTR_ERR(tdma->ahub_clk);
    876         }
    877 
    878         tdma->dma_chan_mask = devm_kzalloc(&pdev->dev,
    879                                            BITS_TO_LONGS(tdma->nr_channels) * sizeof(unsigned long),
    880                                            GFP_KERNEL);
    881         if (!tdma->dma_chan_mask)
    882                 return -ENOMEM;
    883 
    884         /* Enable all channels by default */
    885         bitmap_fill(tdma->dma_chan_mask, tdma->nr_channels);
    886 
--> 887         ret = of_property_read_u32_array(pdev->dev.of_node, "dma-channel-mask",
    888                                          (u32 *)tdma->dma_chan_mask,

I don't think this will work on big endian systems...  Do we care about
that?

    889                                          BITS_TO_U32(tdma->nr_channels));
    890         if (ret < 0 && (ret != -EINVAL)) {
    891                 dev_err(&pdev->dev, "dma-channel-mask is not complete.\n");
    892                 return ret;
    893         }
    894 
    895         INIT_LIST_HEAD(&tdma->dma_dev.channels);
    896         for (i = 0; i < tdma->nr_channels; i++) {
    897                 struct tegra_adma_chan *tdc = &tdma->channels[i];
    898 
    899                 /* skip for reserved channels */
    900                 if (!test_bit(i, tdma->dma_chan_mask))
    901                         continue;
    902 

regards,
dan carpenter
