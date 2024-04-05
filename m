Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238316F850
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330360; cv=none; b=mAb9uRVT+KFa/3kG49sfXWV5prSXw2jJowvrf6QiB9VBQy9y3yKFp6Ka0oG1vc4ykj27RmVOhMGRvACsiVHvs6lOfGRDOa/83EcofFg6COvjXH3RvZzOKK5aEbCzKsxtG0RxeMHcKlAy+8PTBjbBvieQx25rDv8mF2jl7ZyoXqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330360; c=relaxed/simple;
	bh=OPOJ7gxhSbuunCnwq+7E2j1UVR+rJjqTbXN+sHhxDWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUF6W6sK4yHgrfGmVyh9ESBl9iPrcCwZkjXT/iSFJ1b/+giHlKOql+lj6kbXoZwL9j+kIqDa7NuUDvzOTFTggQiKMIWB29e+08KbLxAXa6FFsarizbydPxixdXbkLcWVG6TPhdUtkqKXt7UebESLXAL+8dS5yhRZbDQMhZr3Kek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mAQApPzB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mAQApPzB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e2b3e114fso1353639a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330357; x=1712935157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwzSeuCGkvwhx4uOVCbcmPKFjeLxZNJjsdqpxBkc7rk=;
        b=mAQApPzBG86pI1Gz9GQUAiAHyUayDY2vQ/IqH4cDT3vfcGFXNdNs5mJlsVc57aGWdv
         rwEmcj03CT9lZUfD+zVuHiCmd80BWeo0y/T36qdE+yp84qpHwGYYTmMXF/XR04GkgfRQ
         V9D5lDaRfu7PXfNTKqhH/1VHCg/YcMds+bxSVvwW7wtSqMwGiBEnxOmVjzObgtBxjx75
         9Sx3NxJZsq2FNpMYhhMLZbSLZieqXXhcVCkySl3MsdYUzbg/ozGlwuaaiISqfjIy8F63
         07mYYC9swc1JnWNkx/O4YtnBv5UPw0j+yXwzDkcdI5G4yCbvOfdAt9/pNLX+PTVIm107
         G7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330357; x=1712935157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwzSeuCGkvwhx4uOVCbcmPKFjeLxZNJjsdqpxBkc7rk=;
        b=d4DXKHwJ9rKq097Shz1739JC8xNnE42F6u/bE8QzSGOplv0yt1fbtYrilFadNas5PS
         0XjkvruGXvzGRPw/7hPK/JDjtvm+Jbj0rSWzEBzwDOEqTxQhLCHGQ4n5Vg0ikS671oTV
         QnEweIIWpNRIFm3dF1bRWxmgmkU9CzBsdK3CDGikXQxMBwM6Gobcm7NH07QYlPTO1d3q
         Nzkt/Va4DBcNJbvJhBuOqnXlCLwqj0sO82TPNcIz/WIgybwTBmBbfaJCk/WQTm5Cv5xH
         I8+pwVZosjItG2VVVgy35bTRYUlYkp3+z5SVi7BSzxOR4FVOK6PYb27OTS2uDFBMEm01
         b+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVQTT3R7DhyXNlbraO+6RaTlkwa5UatraAHHyn9LM/KeP2ej3FLwnRUETGej3ETcU3i2nktpjL1S0WwaHFQeEhOxBEoJXB6tpjo7xc=
X-Gm-Message-State: AOJu0YxkIs0uLCgyfTxP/jRlPCcIYjK4iYEG41Oy6DUe8E0JAIITLvjJ
	hLqOIrtbQPkACZSgK3MK5MjrYv3Ep4IJLzZwLAb95MLTOINAlqoTjrxV0vCxgco=
X-Google-Smtp-Source: AGHT+IHdNfOHN8KdJ0UGVVHNf5+DbfhKtJ3VGTQXKmyTimDI1hjPC1O8FtsZS7J+02fAXIWo4GPzvA==
X-Received: by 2002:a50:cc97:0:b0:56e:2cbc:db77 with SMTP id q23-20020a50cc97000000b0056e2cbcdb77mr1450892edi.33.1712330357256;
        Fri, 05 Apr 2024 08:19:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dy26-20020a05640231fa00b0056dbd754811sm907870edb.40.2024.04.05.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:19:17 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:19:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/4] staging: nvec: make keyboard init synchronous
Message-ID: <0e0ee669-7b67-40b2-b46b-fa804a914e75@moroto.mountain>
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-2-marvin24@gmx.de>
 <144d1723-12d5-405e-b37b-498e261dbd90@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <144d1723-12d5-405e-b37b-498e261dbd90@moroto.mountain>

On Fri, Apr 05, 2024 at 06:15:54PM +0300, Dan Carpenter wrote:
> On Fri, Apr 05, 2024 at 04:09:03PM +0200, Marc Dietrich wrote:
> > Improve initialization stability by waiting for command completion before
> > sending the next one.
> > 
> 
> Presumably you experienced an issue with this in real life.  Can you
> describe what that looked like in your commit message?  Should this
> commit be sent to stable?

Actually, some of this information is in the cover letter but the cover
letter isn't preserved in the git log so it's better to put it in the
commits themselves.

regards,
dan carpenter
