Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57F16F28B
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330161; cv=none; b=neQ11HVqL3VVNR0yaeRn7gy2Xir/yNcBQWG0+miyscqLexv/bcOLQUgnvakl4BEHeoFa70MSPeBtwUyBNZXAlQWrY128GiW7nqDaKa2XMwvBbSftCcvLW8epEoNt6cbChL6MbubFviYKlR+wQd7kgysi2u54pHesD9Og0muKwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330161; c=relaxed/simple;
	bh=7P+HGP8/T4lYIz0l2ULz3CKPSC7Jmb8DzjNdoDnLGqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tE6/soajXtVdKRs/+JD+5yh+44++znvKnZiwIH/cDfmk1ggDvSQPjI3BxtaJY4VDVFpY6ANoUQzI6iG/1AycaddmeA+Al1+ochi8E2EyhEeHp2L+uwMSQ1BueXH0RU7UcsGOKZIjXnDwMnUIHC5cWsXd9qX9mTNrDF7WIO+OjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLPTdjtV; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLPTdjtV"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516cdb21b34so2591551e87.1
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330158; x=1712934958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eUbXBoLQzVP7ZJce9Ub2mzhwMzjl4oWganMnS1Dz34=;
        b=pLPTdjtVINfMDbp1Lg9RQrldzGWlA+z3UKtWY1MDU9WfRA8ZZUGS78+CoISf/cWaZO
         6ro4fOMqjPaCfQUmRwuhh6dz973+AbJ4N76RhbKTLYLk4p5nVHWYFWq2YNBA2V+lMRet
         S2pOuw9sXMThNYfMX+tinq1o2wHpIhpFdHstNAXcYeBg1UWI7Yi/trGJCpUl60caRe6/
         W32x23vbuVbiBL0imTvRmYR8izs+IbOQnZl6FjXtRcKvvhguQvUsvbrtJwB7fe5AbCpy
         hXypmhhk2VAn5++mPi7WDebMse+GBRERKEmTnfwycIJ9H8TdpX+BsefSCRwOcBXZu5va
         3F7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330158; x=1712934958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eUbXBoLQzVP7ZJce9Ub2mzhwMzjl4oWganMnS1Dz34=;
        b=cyTdwIMd3nSd4NqKyNT8pcK5LNq++O1kdwDpNYFgql3xQCZJPmuC4TWl6gt8EcBIc3
         wKJSQJiqKIQu9NhlXTv3QkRE6LBK8TUnbLdPt0+XfcnSqh1ttk/HywhSSP8PuGpmG7M3
         rs4R61cDRkVXkP7O2baM2yW0sOLxnyH2ydFNsYxo4KfRff5N7m+met/qy8dEa5si2ApG
         /dHJsqBs8uTZCosroPcHmIH1iPcMt2sN14zMfn1REQTSjubqnnmjMdBPD7ZfQURW3lw0
         bY2sUpAloqC5i4Z0xieLMYVuZsTRwtw06jXFLG6Ldcvh1AHcuoRSHJEK4ig3gCtPRtal
         RJVg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/YsyObqHiAvwONWKlviwCzgQiFalJMUY082r36eNkfSjhj7V0DETO1e+Z42XEjorvnp3XbGANCz4qZLU2motblY0KI6wtfMNhPE=
X-Gm-Message-State: AOJu0YwI976nodGHeOskx3FHIikmtQZ8GgWns6/OvQjx3pvqWeeaAJwU
	wBib6lokoSTIt0idFo0NkvaRw5ckstw5KvTiBehXBMLHM+0MojWN3So2pD8hR2Q=
X-Google-Smtp-Source: AGHT+IFBDTZxRfGRuqujSpDCX4R1pG3Kkz30S6y2lSQqUuiB6mMayQUvXWRL5b+MrApdH9qVYzovUg==
X-Received: by 2002:a19:914f:0:b0:516:9e97:d3ee with SMTP id y15-20020a19914f000000b005169e97d3eemr1180153lfj.53.1712330158047;
        Fri, 05 Apr 2024 08:15:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906411700b00a51a676c596sm799771ejk.121.2024.04.05.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:15:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:15:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/4] staging: nvec: make keyboard init synchronous
Message-ID: <144d1723-12d5-405e-b37b-498e261dbd90@moroto.mountain>
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-2-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405140906.77831-2-marvin24@gmx.de>

On Fri, Apr 05, 2024 at 04:09:03PM +0200, Marc Dietrich wrote:
> Improve initialization stability by waiting for command completion before
> sending the next one.
> 

Presumably you experienced an issue with this in real life.  Can you
describe what that looked like in your commit message?  Should this
commit be sent to stable?

regards,
dan carpenter

