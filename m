Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B4C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Feb 2022 13:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350532AbiBKN3i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Feb 2022 08:29:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350529AbiBKN3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Feb 2022 08:29:37 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6D21DE
        for <linux-tegra@vger.kernel.org>; Fri, 11 Feb 2022 05:29:36 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id m25so8246493qka.9
        for <linux-tegra@vger.kernel.org>; Fri, 11 Feb 2022 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=4GhGoUc/c11sseBRYQgnSGHSukX7xuuq//IPBzW+/F3ULsPiwfAXs/iPbJ2EpckRc6
         mzAS19V+zo/+vlD/Ole7qsvK6uHUe5Vlddpkz20LDNIbKPchqKPErG445oXCSeUEJ3nR
         Y93rF0TEX3mMjgsypXRO4FCc/MMX+bOfzy09qeAXdVv1ZGOMobYHWLpcQg3HYvO6/TMq
         Xx9DPu5l8RnrOKl5oFNxmeie0IHYsXiQ6ePF8GCOi5Zubof5UemFP4bWtt2lRpngB7NN
         3iqHa+dEEBnh9Pg/DFZ8iNRZC4bTy7fQ1A6ojRaT7PlRvaioiTe2YQdvZa2OFzCZswit
         fv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=QktX2ssl25apOdnPKKZ/bu8pWHoBvQbYMQkU42Dwl9aAF+f4c6fPoM9zFytbkvi1ep
         IAysA4Qcm1FeyEPbbQOtoZRsmuS0J5EEaJO8Vw3CL+/cE2bTo+ofM12ZUM+XXmPhVBNx
         02ddh+lp5zGA7+sViUcg/kbl638TF7ZqBr4Q+3NmNvVQmVoLBKRT+kKOXGjz8DT67v0D
         AXgDS/nyJdgIeUk3HEyfOrYpmWkH9LSx9xQozpTQxvsRKXIFa+K/Z9+JANU16zAysUKX
         qD+bucY49z4a64bSWSrktiPMjdHAEa53m9rirtz4D/BuAbrwIOu/pVIxaZ4MYsqgAnYU
         LMUA==
X-Gm-Message-State: AOAM530Z4VUR/WC5h95zGCwW2ppvoCAYp142L1aGHBtFjRVgJBbI0UAk
        dUYXh65AjZxH5Eb+qdSvHQxY/ZM7jr26tYH0
X-Google-Smtp-Source: ABdhPJx3tflCKvRAYZjABa3eTJaLgwV9YMRtRuFiWIDpJpG/kVVAP086Nrm+UHeTe0IgS1KD4BQHlw==
X-Received: by 2002:a05:620a:ced:: with SMTP id c13mr693431qkj.636.1644586175987;
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h6sm11294073qkk.14.2022.02.11.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Message-ID: <d986ab76a7c52a9a2ce62c1edb07f520c9df51c4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: v4l2-ctrls: Add new
 V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Feb 2022 08:29:33 -0500
In-Reply-To: <20220207141937.13089-2-digetx@gmail.com>
References: <20220207141937.13089-1-digetx@gmail.com>
         <20220207141937.13089-2-digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le lundi 07 février 2022 à 17:19 +0300, Dmitry Osipenko a écrit :
> Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags that are needed by
> NVIDIA Tegra video decoder. Userspace will have to set these flags in
> accordance to the type of a decoded frame.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Can you share here (out of commit) a userland implementation that was used to
demonstrate the new API ? It does not matter which project (GStreamer, FFMPEG,
Chromium, your_test_progtram). Should be fairly straightforward. This is just to
be transparent.

>  .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst   | 6 ++++++
>  include/uapi/linux/v4l2-controls.h                          | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index cc080c4257d0..f87584ad90ba 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -616,6 +616,12 @@ Stateless Codec Control ID
>      * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
>        - 0x00000004
>        -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
> +      - 0x00000008
> +      -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
> +      - 0x00000010
> +      -
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c8e0f84d204d..e3d48d571062 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1563,6 +1563,8 @@ struct v4l2_h264_dpb_entry {
>  #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
>  #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
>  #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
> +#define V4L2_H264_DECODE_PARAM_FLAG_PFRAME		0x08
> +#define V4L2_H264_DECODE_PARAM_FLAG_BFRAME		0x10
>  
>  #define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
>  /**

Please update the doc too, see:
  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst:

