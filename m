Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFB81B964
	for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246780; cv=none; b=SAXrtffKofRNTQ19pgGRXGagWfwvjbR/qI2/bJVcqmK8bVoGtjb8WNL68DMkpJgTVYZ/4ExZsKE9RIi5NLrHBQS17nhYVynvQcmgd0PsJyutClzJRAd2CuEVH1Nf+o8H1TjnGPdOq3Dfi8s80k6CZTiSWZPe5ZhECm1uMNuHIuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246780; c=relaxed/simple;
	bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WV+f40HTMxF5Q5qseOonB/k5tUAETFD7ursXya0l32nZE66KLO8vyV58pthWMHSvYNfy7Jacnvv42IctUInsd1Zjye3kwdCn46g9X8QblwjBeaYwlnumaNLk7j8lBthEAatc/gvZEwGqRJcZz2amr0AeVKoxi5Lm7FD++dac6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuoDHrW/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuoDHrW/"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso44545a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719246777; x=1719851577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
        b=fuoDHrW/oAW1ZdW7p9Ktc6/sfwx0yDcJ0RRjK1AeYEh8z+CHQuJVoqaULhZ6ya/kDb
         POBZlPwzSkkFroQARJB7IyLpb9LUITWAWA/I4f/vZMJOnu+Zr9oyzRDUHCnsWUbn5Hnd
         4hoTgJ7QpOO3GPaoFaTpBCLLiPIJIlpytq/Ebj57/kxSxTfKfEiW6HD5mJK4jsdelMWs
         QGhNcrYeRg7AAWMpP8Ow0nX1wyTDkmfVMlnxD/UIQXQzB8IX2A6KJLo6SdfIZkkSbh7A
         KQirw0rNK4vjVxNhvOEKYXw1hPu6izWBfBcjIHR6O36fVHrG3m6UH3l057yv/NbCsNzA
         4vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246777; x=1719851577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
        b=nAJ4MWmHaA5QPYTqMsLyttdHkFPc2d62uvOBWF2Mv6IqtFSq4a8HOkR52XPGhj4rgS
         xYTR2yEiu91sKnd/yXbRhy8OpbHOk/dPZxbupiZclZ6U23i0NxDgnGYY42ISJnzVZQc1
         VscxRGOy8rAY3JsxMftEBd36orMHucllkrsQGff5vSfgJ2L9BgB5lFzoaP22gOHhfd9S
         lkAhnhLvVa+fDjjliX474jvf3TuI26ClUehHRNnq/PqV3qNFjZIzYfFpi1dkkaEEV+0i
         dTtbs7476p7rNdILcQMfoj3x7be6LRIGeRZ8/C9+1oFQOp6iEgqU+qwsQv19gQOA10gD
         B6lA==
X-Forwarded-Encrypted: i=1; AJvYcCXjqi6FQK1BEi+ouHb8P0gbuhqirduh51JCRRTryAN6YRe+bkbiobWKlpb/aVa+9zKrUNkiDWqMhZjHGhwnl3+ZZh8wLkf1YUDxRjY=
X-Gm-Message-State: AOJu0Yw+chEcj1cSwhUuH+cgwsvK8YD3cmWAhhHkMNenEYL1LfdLXr3V
	XVNI2RACCd44v36QHI3Oq4rZXk8cUv4Nl7cYnWE4kGcE26M16OzjnxuRwFO5aRS3oXmNXMD9Cqp
	ZgEwGxMWge/JXOZtOzSXnHq7fcaUJsy63E6+n
X-Google-Smtp-Source: AGHT+IEl5Ew5w+PWn74FGxxwXzaaD09WahDkImti/Go2baFYDXsiLn8hpTeaw26FMKmyFQ7L9WFL0AFDnp6HfsfXAqA=
X-Received: by 2002:a05:6402:2788:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-57d419eced6mr382420a12.3.1719246776229; Mon, 24 Jun 2024
 09:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com> <20240510201244.2968152-5-jthies@google.com>
 <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com> <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
 <CAA8EJprxHq65mAU6a9iGD6Yus-VB2x3WP5Z8JWN1oUwn+zQDfg@mail.gmail.com> <bc9cd446-5e19-41c4-a316-9eb362f2d190@nvidia.com>
In-Reply-To: <bc9cd446-5e19-41c4-a316-9eb362f2d190@nvidia.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 24 Jun 2024 09:32:44 -0700
Message-ID: <CAMFSARerhgEVy4u2Guq5D_ygp5Fm4Ay6CtqjaL8iZHqJPYzD4g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate modes
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,
thank you for catching this. I'll post a fix to address the null
pointer dereferencing.

Thanks,
Jameson
