Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55937A839
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940803; cv=pass; b=RN9UiBv4cbanw42GRdCE2Fj+hxURIiPQ0LJosECiHYjTrRWa7xY28IPTWqBHtnF+Gu/IRCML0cD4qGLrgOfqPU5jd+Rafcp0s8WLjKMK89YN3kDNLzdaaeaddL42oEAQh+h4ZbD9r5fJPtcDeDy1lQfV9W6E8gROUpfTl1Ps9xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940803; c=relaxed/simple;
	bh=KO/zBTNh5ocUqwGqELQr7gjJafYvxtj0nAW0zFpegvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AauScOFISXPa+NcEGzDqVvKJcdvcN40KOWOkADfN45emByUxgpdoLLpbf9nRVTFI512YtTwtvzUu76EotyHlbWXwJz6cROOuJX2wg8NcXM42jhKfcSIPScRIfLDBwccEgP5MTHu30jUry5T3HJh0SGGRVvs0FJhVwpwUa/u78Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MA3mSI7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOS5ams2; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MA3mSI7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOS5ams2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98rso793130
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 11:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xk40p3spSA7Dl+t/EMDWt78ol/53BabP80E+M7SNBGM=; b=MA3mSI7lKin5G10x
	e2TdGUkqWxoxp6e7KjC3pfkH64B638tSUZru0ZFhLPUE4iT2e92yQwLqt7P/GFVl
	NffKvMPDecUSBU0cE0e1jjPlMUH4jDen+MJAqhR4mqWImokjkc23eXIsLfgcamzv
	NWM2hPEkvXYA0oB6lzHWK/JONgL6VhFy1NQn1Gp+UcJtdzr2EKZNyZhKLGRShdiY
	Irtm96aloGOQS6EvuTLgHQNwTx53ZOcn33ON3q+b1B9Zw05H7QLOY102z/EOgnwt
	w7tAC793qPmH5ixhsdbiR9mRddl7Y2rIooiUx7o1F5VGZtvGa6lQJMYIDabOa/qF
	ilV4/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrcxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 11:06:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso35082596d6.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 04:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940800; cv=none;
        d=google.com; s=arc-20260327;
        b=adw5Q04ksEAonQ8es4eNItZDbfIVdGsgclJ16Xg28hc9aQyPsHPbQBOxaCjqztywcP
         GUoHjQmX37Y2wNryYY8v9QfdzWWAtdZ9tBtFW8cwelJRdtYGlcr6K7cU82fc0c0dHFWk
         txHwkTd1gn+dRmr9AD9etxsRP1uFkERk0Yyu+XMQpkDfYEIMTodgxjjHrXW9JePdNXqr
         hWcI/e/capc8wI4t0vw++aOgdDosH/rO+dCdPuRW3bNbdrfmYV8OE0s6UABdUQaE03FS
         dqCsiXBfabM0U2U/MpVsL/ycVrbU9VCno339fu12MgNAicXZKw3wZdnOdEwxNgVr3Br4
         CK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xk40p3spSA7Dl+t/EMDWt78ol/53BabP80E+M7SNBGM=;
        fh=Pl2mDvHLcKo6DvTChgVEJh2eRW3/dBj8QItDftti0LA=;
        b=C1WpfWV2ZMTDTczy/3bCvTPGROnGk5OM5P7nvuxoFFq3lHuhOj1Uo76X5Z5kKTnlXZ
         pfHhJ/vEWF0rCu9lun9Q0xZMPMgr7uNeXQBwwZqznt7pv0Z6Og9YY3IwC297klLmROYt
         pwXiD4DtISIBbS41nJxX3gDduLv1duSUdOA4Bzybtm2Gi6tWpCFUvFgTPI7deWuNL7hj
         bOHSwjB5Mo1ccsdj0G4834+CfJLyC/ujFdhEGcJAesYUc4nnYJKbV7scSAQ1EeWXOd+Z
         7poo9V5Cq8M7NQdp7V2C5XgpI1Csy6k9yETootvgOcXCmBvJ/nG2YmbdR+OQ8is6kZzA
         U8Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940800; x=1784545600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xk40p3spSA7Dl+t/EMDWt78ol/53BabP80E+M7SNBGM=;
        b=XOS5ams2RCZKkVsUIwqmFFPipsl62dBqPVbFjUanOba93Do2NVgWmWsapl1A0yZ/yY
         9GtjzdqlwEg6YkR4I9dh2qoEQe3v53H5PqXmEwcAL2/6G+gWioN1hGthwiBokZUV2LSL
         3mZVKGDJQfHUJ8vFVv/Y7l3U1ygAUxnzYGECgICvW/uxRQzmjnEE/kmaG4eMe2laDrJ3
         43jtoN+gQ8FHdzo5aw1QRutPU+MBnW4aCfYJwoLbffF1f6QM2aDwzh7hjJcB29DH2sgC
         vKcrlfjUagjRVhGMxc1UADTuUwSGSmCorE0RWQqXyX1nv9p5Yju6f1KXocHhgdq1HVMU
         jsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940800; x=1784545600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xk40p3spSA7Dl+t/EMDWt78ol/53BabP80E+M7SNBGM=;
        b=NqbUj3wzDFRfyqe7KcXqKt4leVT6jGBzkuB8RG+NIe71KB1l+A443ey0WDpAcp8P3A
         N5BHp2EjkoVnri74UXL1bHbQs7w4YTW7VzVV/g4fAtKdVDv0NQ+9181V8PpAho9aq83Q
         6hXbjqm98XWG8s/ZBZ7QqmnghNQAS3vn0p7n9E5IUVgLWh5TJpaZDH8TXFqmmkuOybRy
         aD1CN01jSxVfdI3oXky/rI+XTQBWITKY9i6BAqWrGj5gHz6EeKxTi+yfO9CNqdN6k7ly
         St3xRYtk0RHdliph9uNWOAPwXut3YOmRWN2bq/EpKojfDLpN7OTR1/98unYb5/GhEYUW
         hALg==
X-Forwarded-Encrypted: i=1; AHgh+RqecwYfwH/I5Eaqf7qKMBj5bOpQ5Xsg9JG2rGO50OtFnhgksY82RX2P29vJAcN9qwaRSuhQU8hfal6S1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEC1+T7Vhv7OnrM/8ZApcd1vg3oXWfI5L4+bUB2sOy9QKEEqY
	pfkpJ8RxFT86G0YjmeG+x/sI/zqgwLsVuKNmV6eIjHx4OfJuL82aa9Naiwp9TjKAGArqg3HTxyK
	/GfXFnFvYGoccrRWOY5MjR4pxvTnuw2U0ikv+9sTExbSbfkpOmO7rof50xfGCdZY6e/ismrCqdM
	Fe9ffNL64kfAgcAFXJmFAjv6zcBVHlTcbA/TIFQX+rivpY/SJ7
X-Gm-Gg: AfdE7cmuk8A3vf1mw31OzxACnGrLFEHkdqqXOmGkrTgyQyXePYD35MpA4m2thv3gd6T
	r1aWd+znSgfbsvTG9wv540ubd1oXnK5l/OeI9bInIhLLXvkcWXX8L+/6oyByGkfA8ys2AH+jdRz
	KHtr+uw76CUjB5Mz7czRx/E7wH5RdtlRJRjcETju1cVpSDN7l3lByVgQk/3PiSklabzCm/
X-Received: by 2002:a05:6214:3104:b0:8ec:26a9:17d3 with SMTP id 6a1803df08f44-90400b8c041mr92851746d6.41.1783940800187;
        Mon, 13 Jul 2026 04:06:40 -0700 (PDT)
X-Received: by 2002:a05:6214:3104:b0:8ec:26a9:17d3 with SMTP id
 6a1803df08f44-90400b8c041mr92851416d6.41.1783940799744; Mon, 13 Jul 2026
 04:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602193248.443101-1-jonathanh@nvidia.com>
In-Reply-To: <20260602193248.443101-1-jonathanh@nvidia.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:28 +0200
X-Gm-Features: AUfX_mzZq7FFwaTj94C41S_9CAvUcbYXmH-pUFHdD2R2hW7sOaExdttegTZszMY
Message-ID: <CAPx+jO-cbyeMALMtSSuyQosLdp8yH+-NP7ELTwfhNoeW4CMkkg@mail.gmail.com>
Subject: Re: [PATCH V3] pmdomain: tegra: Add support for multi-socket platforms
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX8IiabA66k7Xr
 B4Ke/uhfPNaESFrbrpfppKsHWNaBHEmq5+rMJtqTpbnqgukHJytc8ZzhbFaXz0Rh6+Km5jOe+km
 aDbSKmM9vyUow2ksPAEDn8ZzNvXOLnXbWDq0/ROC9CdW/x/XDLMktVYfPgW60dv/hv0GxnRFI3R
 Y3GVU5XP35m1HAY1/OkU+YdoLgXKQyO9k4f3HZCGdv8FA0T7G0wnCp7IQHg3yrfv6CJQn9b0zXx
 YpTEg3YUyuRyrqmyyDovIopfYAt3NtOD46czPBxCL4b+u6T6QulWHfEUpHa3xN+0Jn1Vc5h/ijO
 HNliqM8zY/wiKHthHgsLJQ+SB/R982mpiF4Jtx1ufpTgTMOrIHdceMT3y5qZoQje4tnQG3ei0TW
 enY1fAJCvHVvD8816fOh4ICfkXoBjybY+9BOAhtrrxXgRZQ6zI+3zr2J/eEjXPdQgvu7fWlD8Zr
 QM5DVvED1ksFE+ZctDg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54c6c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Ikd4Dj_1AAAA:8 a=mQxNfCW7Vcdlk-GrVDgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: a64npWJJ-Q1Sq3Wn_-MZG4KW4Mu3f-8w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX8rbv2fd+RKQu
 Sp5MKWLpRi8tSquxEWdonhNNG3NTBiDaXqaYAGAFLmiEYgQNHFltSDkPbwD+Qffv4abAXuKyUBZ
 dqXRKbd1A0FN4xRrjwVgm72hBs7z/PM=
X-Proofpoint-ORIG-GUID: a64npWJJ-Q1Sq3Wn_-MZG4KW4Mu3f-8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115

On Tue, Jun 2, 2026 at 9:33=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
> On multi-socket platforms each socket has its own BPMP that is
> registered with the kernel. For such platforms prefix the NUMA ID for
> each socket to the BPMP powergate name to ensure there is a unique name
> for each power-domain. Note that we only add the NUMA ID for powergates
> that return a valid name because an invalid name indicates that the
> powergate ID is not supported.
>
> Note the check for the NULL string is moved into the function
> tegra_bpmp_powergate_get_name(), because in the multi-socket case we
> must only add the prefix if we receive a valid name. A NULL string
> indicates that there is no valid powergate associated with the ID that
> is being queried.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes since V2:
> - Moved the test for a NULL string to a common location that can be
>   used for both single and multi-socket platforms.
> Changes since V1:
> - Use NUMA ID as a prefix and not a suffix for the powergate name.
>
>  drivers/pmdomain/tegra/powergate-bpmp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/tegra/powergate-bpmp.c b/drivers/pmdomain/t=
egra/powergate-bpmp.c
> index 8cde4f384846..e6a7e025b012 100644
> --- a/drivers/pmdomain/tegra/powergate-bpmp.c
> +++ b/drivers/pmdomain/tegra/powergate-bpmp.c
> @@ -137,6 +137,13 @@ static char *tegra_bpmp_powergate_get_name(struct te=
gra_bpmp *bpmp,
>         if (err < 0 || msg.rx.ret < 0)
>                 return NULL;
>
> +       if (response.get_name.name[0] =3D=3D '\0')
> +               return NULL;
> +
> +       if (dev_to_node(bpmp->dev) !=3D NUMA_NO_NODE)
> +               return kasprintf(GFP_KERNEL, "%d-%s", dev_to_node(bpmp->d=
ev),
> +                                response.get_name.name);
> +
>         return kstrdup(response.get_name.name, GFP_KERNEL);
>  }
>
> @@ -234,7 +241,7 @@ tegra_bpmp_probe_powergates(struct tegra_bpmp *bpmp,
>                 struct tegra_powergate_info *info =3D &powergates[count];
>
>                 info->name =3D tegra_bpmp_powergate_get_name(bpmp, id);
> -               if (!info->name || info->name[0] =3D=3D '\0') {
> +               if (!info->name) {
>                         num_holes++;
>                         continue;
>                 }
> --
> 2.43.0
>
